# Etapa 1: Construcción Angular
FROM node:20.19.3-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --legacy-peer-deps
COPY . .
RUN npm run build -- --configuration=production --base-href /

# Etapa 2: Servidor Nginx
FROM nginx:1.25.3-alpine

# Elimina archivos por defecto
RUN rm -rf /usr/share/nginx/html/*

# Configuración para SPA
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia los archivos construidos (¡NOTA la subcarpeta /browser!)
COPY --from=builder /app/dist/entra-id-oidc-angular-msal-poc/browser /usr/share/nginx/html

# Permisos
RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]