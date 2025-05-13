# 1단계: 빌드용 이미지
FROM node:lts AS build-stage

# 작업 디렉토리 설정
WORKDIR /app

# 종속성 설치
COPY package*.json ./
RUN npm install

# 전체 소스 복사 후 빌드
COPY . .
ARG BUILD_ENV=dev
RUN npm run build:$BUILD_ENV

# 2단계: NGINX 이미지에 정적 파일 올리기
FROM nginx:stable-alpine AS production-stage

# NGINX 설정 파일 덮어쓰기
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Vue 빌드 결과물을 NGINX가 기본 서빙하는 위치에 복사
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Health check를 위한 기본 포트 노출
EXPOSE 80

# 컨테이너 시작 시 NGINX 실행
CMD ["nginx", "-g", "daemon off;"]
