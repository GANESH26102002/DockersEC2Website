FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/EasyFolio/EasyFolio.zip .
RUN unzip EasyFolio.zip
RUN mv EasyFolio/* .
RUN rm -rf EasyFolio EasyFolio.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
