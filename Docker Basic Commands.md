Docker Basic Commands
===

### DOCKER ###
==

**list image**

`sudo docker images`

--

**list of container with status**

`sudo docker ps -l`

--

**run image**

`sudo docker run <image_id>`

--

**run image with port**

`sudo docker run -p <port>:<port running on container> <image_id>`

--

**run image as daemon**

`sudo docker run -d <image_id>`

--

**stop container**

`sudo docker stop <container_id>`

--

**kill container**

`sudo docker kill <container_id>`

--

**remove container**

`sudo docker rm <container_id>`

--

**remove image**

`sudo docker rmi <image_id>`

--
