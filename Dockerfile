# build phase-step
# tagging phase with name builder
FROM node:alpine 

WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

# run phase
# build dir is located inside the current dir - /app/build
FROM nginx

# port for incoming traffic
EXPOSE 80

# to copy build dir & put it inside nginx
COPY --from=0 /app/build /usr/share/nginx/html

