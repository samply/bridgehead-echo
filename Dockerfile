# This is inspired by https://lipanski.com/posts/smallest-docker-image-static-website
# but without relying on an external Docker image

FROM busybox:stable

# Create a non-root user to own the files and run our server
RUN adduser -D static
USER static
WORKDIR /home/static

# Copy the static website
# Use the .dockerignore file to control what ends up inside the image!
COPY index.html .

# Run BusyBox httpd
CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]
