server {
    listen 80;
    server_name oulcaid.com www.oulcaid.com;

    location / {
        proxy_pass http://localhost:8888;  # Adjust this if your Docker container runs on a different port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
