#!/bin/bash

echo "1. Nginx 설치 중..."
apt update && apt install -y nginx

echo "2. GCS에서 배포 파일 다운로드 중..."
gsutil cp gs://vue-pension-builder-bucket/dist/dist.tar.gz /tmp/dist.tar.gz

echo "3. 압축 해제 중..."
mkdir -p /var/www/html/app
tar -xzf /tmp/dist.tar.gz -C /var/www/html/app

echo "4. Nginx 설정 적용 중..."
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    root /var/www/html/app;
    index index.html;
    location / {
        try_files \$uri \$uri/ /index.html;
    }
}
EOF

echo "5. Nginx 재시작 중..."
systemctl restart nginx

echo "Vue 앱 배포 완료! Nginx 서비스 시작됨."