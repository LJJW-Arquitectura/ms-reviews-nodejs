# Use Node v8 as the base image.
FROM node:8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# Run app
CMD ["npm", "start"]

# COMANDO DOCKER RUN
#sudo docker run  -d --publish 4000:4000 -e MYSQL_USER='root' -e MYSQL_PASSWORD='password' -e MYSQL_DATABASE='test' -e MYSQL_HOST='172.17.0.4' --link test-mysql-microservice:db --name=test-nodejs-microservice test-nodejs
#sudo docker run  -d --publish 4000:4000 -e MYSQL_USER='root' -e MYSQL_PASSWORD='reviewPassword' -e MYSQL_DATABASE='review_suggestions' -e MYSQL_HOST='172.17.0.4' --link test-mysql-microservice:db --name=test-nodejs-microservice test-nodejs
#sudo docker run  -p 3003:3003 --link test-mysql-microservice:db --name=test-nodejs-microservice test-nodejs

#BORRAR DOCKER COMPOSE
#sudo docker-compose rm -v

#SABER EN QUE PUERTO CORRE LA DB
#sudo docker inspect reviewsms_reviews-db_1 | grep IPAddress

EXPOSE 3003