# Dockerfile starts with a base image(parent image)
# Its a docker image that your image is based on. (basically the base thing on top of which your code will run)

# You choose the base image , depending on which tools you need to have available

# FROM -> Build this image from the specified image (Node installed)
FROM node:19-alpine

# COPY -> copies files or directories from src and adds them to file system of the container at the path given
# This command is executed on host (local machine)
COPY package*.json /usr/app/
COPY src /usr/a/

#WORKDIR -> Sets the working directory for all the following commands
# After copying the files change the directory where the run command will be executed
WORKDIR /usr/app

# RUN -> Will execute any command in a shell inside the container environment (npm installed)
# This command is executed in container
RUN npm install 

# After npm is installed we need to run our server.js application
# CMD -> If this is the last command that needs to be executed then we use CMD["<executable>", "<parameter>"]. 
# Basically the instruction that is to be executed when a docker container starts
CMD ["node", "server.js"]


# Dockerfile => (buld) Docker Image => (run) Container
# Command to build image => docker build -t <"give a name":<give a version> <path of your Dockerfile ("." if its current directory)>
# Command to run image => docker run -d -p 3000:3000  sunil-node-app:3.0