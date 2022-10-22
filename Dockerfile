# Get the latest ubuntu container
FROM ubuntu:latest 
# Selects the working directory
WORKDIR /ProjectTurtle 
# Copies the main shell scipt to Docker container
COPY ./menu.sh ./menu.sh 
RUN apt-get -y update 
# Runs the script
CMD ["./menu.sh"]

