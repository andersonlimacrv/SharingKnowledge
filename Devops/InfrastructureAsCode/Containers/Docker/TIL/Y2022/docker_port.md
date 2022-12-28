~~~yml
version: "3"
services:
  web:
    build: .
    ports:
      - "8000:8000"
    # The first port is host's port and the second is the remote port
    # (i.e: in the container).
    # That expression bounds the remote port to the local port.
~~~

### published ports

~~~html
- By default, when you create or run a container using docker create or docker run, it does not publish any of its ports to the outside world.
- To make a port available to services outside of Docker, or to Docker containers which are not connected to the container’s network, use the --publish or -p flag.
- This creates a firewall rule which maps a container port to a port on the Docker host to the outside world. Here are some examples.
~~~

Flag value	Description
-p 8080:80	Map TCP port 80 in the container to port 8080 on the Docker host.
-p 192.168.1.100:8080:80	Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.100.
-p 8080:80/udp	Map UDP port 80 in the container to port 8080 on the Docker host.
-p 8080:80/tcp -p 8080:80/udp	Map TCP port 80 in the container to TCP port 8080 on the Docker host, and map UDP port 80 in the container to UDP port 8080 on the Docker host.


[source](https://docs.docker.com/config/containers/container-networking/)
