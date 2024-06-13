# resume


Ensure that your Nginx configuration is set up to handle requests for oulcaid.com.

  1.  Open your Nginx configuration file for editing:

    `sudo nano /etc/nginx/sites-available/example.com`

  
  2. Ensure it has the following content (adjust the proxy pass to your Docker container if necessary):

```
server {
    listen 80;
    server_name example.com www.example.com;

    location / {
        proxy_pass http://localhost:8888;  # Adjust this if your Docker container runs on a different port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

  3. Enable the site by creating a symbolic link to the sites-enabled directory:

  `sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/`

  4. Test the Nginx configuration for syntax errors:

  `sudo nginx -t`

  5. Reload Nginx to apply the changes:

  `sudo systemctl reload nginx`
  