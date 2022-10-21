FROM ubuntu:latest #to run on latest ubuntu
WORKDIR /ProjectTurtle #to set working directory
COPY ./ProjectTurtle #to copy contents of current directory
RUN apt-get -y update  && apt-get install -y python #to update os and setup python environment
CMD ["./menu.sh"] #to run the following command when it boots

