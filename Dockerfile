FROM node:alpine

WORKDIR  '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
# --from=0 copies from the built artifact from the previous stage
COPY --from=0 /app/build /usr/share/nginx/html
