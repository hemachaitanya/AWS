FROM ubuntu
RUN apt update && apt install git
RUN git clone https://github.com/gothinkster/angular-realworld-example-app.git
WORKDIR angular-realworld-example-app
RUN npm install -g @angular/cli && npm install
EXPOSE 4200
CMD [ "sleep","1d" ]