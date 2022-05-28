# load image (nodejs)
FROM node:16

# commands after this line will work in this working directory
WORKDIR /src

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

# docker create volume random

# docker run -dp 4000:4000 -v random:/src/resources/files random




# docker run -dp 4000:4000 `
# -w /src -v "$(pwd):/src" `
# node:16 `
# sh -c "yarn install && yarn run dev"
