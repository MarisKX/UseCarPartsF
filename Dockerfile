# Build stage
FROM node:14 AS build-stage
WORKDIR /usedcarpartsb
COPY package*.json ./
RUN apt-get update && apt-get install -y nodejs npm
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:1.17 as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
