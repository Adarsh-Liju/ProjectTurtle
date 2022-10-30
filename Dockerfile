# Get the latest ubuntu container
FROM ubuntu:latest 
# Selects the working directory
WORKDIR /ProjectTurtle 
# Copies the main shell scipt to Docker container
COPY ./docker_test.sh ./docker_test.sh 
RUN apt-get -y update 
# Runs the script
CMD ["./docker_test.sh"]

