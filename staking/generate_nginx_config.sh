#!/bin/sh


cat <<EOF > /etc/nginx/nginx.conf
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    server_tokens off;

    
    limit_req_zone \$binary_remote_addr zone=ipfs_zone:10m rate=${QPS};

    server {
        listen 8088;

        location /ipfs {
            proxy_pass http://ipfs:8080;  
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;

            
            limit_req zone=ipfs_zone burst=10 nodelay;
        }
    }
}
EOF
