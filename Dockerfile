# load image (nodejs)
FROM node:16

# commands after this line will work in this working directory
WORKDIR /app

# install dependecy
COPY package*.json ./ 
RUN npm install

# copy whole project (except file listed in .dockerignore)
COPY . .

# port that container will listen to at runtime (8080 for public access)
ENV PORT=4000
EXPOSE 4000

CMD ["node","app.js"]


# commands

# docker run -dp 4000:4000 random

# docker run -dp 4000:4000 -v random:/app/resources/files random

# docker run -dp 4000:4000 -v "C:/Users/petch/Desktop/docker-test/resources/files:/app/resources/files" random

#  ---------------------------- dev ----------------------------

# FROM node:12-alpine

# RUN apk add --no-cache python2 g++ make

# WORKDIR /app

# COPY . .

# RUN yarn install --production

# CMD ["node", "app.js"]

# EXPOSE 4000

# 12-alpine

# docker run -dp 4000:4000 `
#      -w /app -v "C:/Users/petch/Desktop/docker-test:/app" `
#      node:12-alpine `
#      sh -c "yarn install && yarn run dev"


# 16

# docker run -dp 4000:4000 `
#      -w /app -v "C:/Users/petch/Desktop/docker-test:/app" `
#      node:12-alpine `
#      sh -c "yarn install && yarn run dev"
