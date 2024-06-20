

sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
# Default server block listening on port 80
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    server_name _;

    location / {
        return 404;
    }
    
    location /api1/ {
        proxy_pass http://localhost:7071/;
    }
    
    location /api2/ {
        proxy_pass http://localhost:8081/;
    }
    
}
EOF'

sudo nginx -t

sudo systemctl reload nginx

sudo systemctl status nginx