# Use an official Nginx image as a base
FROM nginx:alpine

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the website files to the container
COPY . /usr/share/nginx/html

# Set the correct permissions
RUN chmod -R 755 /usr/share/nginx/html