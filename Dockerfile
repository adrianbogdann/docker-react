# first phase
FROM node:16-alpine as builder

WORKDIR /app

COPY ./package.json .
RUN npm install
COPY . .

RUN npm run build

# second phase
FROM nginx
# we only copy the /build folder, anything else is deleted
COPY --from=builder /app/build /usr/share/nginx/html