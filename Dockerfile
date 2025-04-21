# 1단계: Vue 앱 빌드
FROM node:lts as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 2단계: Nginx에 정적 파일 복사
FROM nginx:stable-alpine

# 커스텀 nginx.conf 복사 (루트 기준)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# dist 결과물을 nginx 루트에 배포
COPY --from=build /app/dist /usr/share/nginx/html

# (선택) Healthcheck 지원
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/healthz || exit 1