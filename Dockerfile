  # Nginx 공식 이미지 사용
  FROM nginx:stable-alpine

  # Vue.js 빌드 결과물 복사
  COPY --from=node:lts /app/dist /usr/share/nginx/html

  # 사용자 정의 Nginx 설정 파일 복사 (필요한 경우)
  COPY ./nginx.conf /etc/nginx/conf.d/default.conf

  # Nginx 실행
  EXPOSE 80
  CMD ["nginx", "-g", "daemon off;"]