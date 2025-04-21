FROM nginx:stable-alpine

# 사용자 정의 nginx.conf 적용
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 이미 빌드된 dist 결과물을 복사
COPY dist/ /usr/share/nginx/html

# (선택) 헬스체크 경로 대응
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/healthz || exit 1