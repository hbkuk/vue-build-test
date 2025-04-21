<!-- src/views/HomeView.vue -->
<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'

const todos = ref<any[]>([])

onMounted(async () => {
  try {
    const res = await axios.get('https://dummyjson.com/todos')
    todos.value = res.data.todos.slice(0, 100) // 상위 5개만 표시
  } catch (err) {
    console.error('🔥 API 요청 실패:', err)
  }
})
</script>

<template>
  <div>
    <h1>🏠 Home Page</h1>
    <router-link to="/about">Go to About</router-link>

    <h2 style="margin-top: 2rem;">📋 할 일 목록!!!!!</h2>
    <ul>
      <li v-for="todo in todos" :key="todo.id">
        {{ todo.todo }} - 완료: {{ todo.completed ? 'O' : 'X' }}
      </li>
    </ul>
  </div>
</template>