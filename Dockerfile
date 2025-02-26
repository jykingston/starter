# Dockerfile
FROM alpine:latest

# Install a simple web server (nginx in this example)
RUN apk update && apk add nginx


# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
