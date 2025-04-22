FROM nginx:stable-alpine

# nginx.conf 복사
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 빌드 완료된 dist 복사
COPY dist/ /usr/share/nginx/html
