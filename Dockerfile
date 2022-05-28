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
ENV PORT=8080
EXPOSE 8080

CMD ["npm","start"]


# commands

# docker create volume random

# docker run -dp 4000:8080 -v random:/src/resources/files random
