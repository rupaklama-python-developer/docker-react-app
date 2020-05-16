# build phase-step
# tagging phase with name builder
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# run phase
# build dir is located inside the current dir - /app/build
FROM nginx

# to copy build dir & put it inside nginx
COPY --from=builder /app/build /usr/share/nginx/html

