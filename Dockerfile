# syntax=docker/dockerfile:1
FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="chavora" \
      org.opencontainers.image.description="Static UI preview for chavora AI chat interface" \
      org.opencontainers.image.vendor="OneByJorah" \
      org.opencontainers.image.version="1.0.0"

WORKDIR /usr/share/nginx/html

# Copy only the static frontend assets.
COPY public/ .

# Provide a minimal nginx config that serves the static site on port 8787.
# Main config writes pid/temp/log paths under /tmp so nginx can run unprivileged.
RUN printf 'pid /tmp/nginx.pid;\nworker_processes auto;\nerror_log /tmp/nginx-error.log warn;\nevents { worker_connections 1024; }\nhttp {\n    access_log /tmp/nginx-access.log;\n    client_body_temp_path /tmp/client_body;\n    proxy_temp_path /tmp/proxy;\n    fastcgi_temp_path /tmp/fastcgi;\n    uwsgi_temp_path /tmp/uwsgi;\n    scgi_temp_path /tmp/scgi;\n    include /etc/nginx/mime.types;\n    default_type application/octet-stream;\n    server { listen 8787; server_name localhost; root /usr/share/nginx/html; index index.html; location / { try_files $uri $uri/ /index.html; } location /health { access_log off; return 200 "ok\\n"; add_header Content-Type text/plain; } }\n}\n' > /etc/nginx/nginx.conf \
    && printf '# main config is generated in /etc/nginx/nginx.conf\n' > /etc/nginx/conf.d/default.conf \
    && mkdir -p /usr/share/nginx/html /var/cache/nginx \
    && chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /etc/nginx \
    && chmod -R g+w /var/cache/nginx

EXPOSE 8787

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:8787/health || exit 1

USER nginx

CMD ["nginx", "-g", "daemon off;"]
