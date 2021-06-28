## build docker image
```
sudo docker build -t dli-nano-ai-cam -f camera.Dockerfile
```
## run docker image
``
#run xhost + in host machine and then run docker image:
```
sudo docker run --runtime nvidia -it --network host  --volume /tmp/argus_socket:/tmp/argus_socket --device /dev/video0 -e DISPLAY=$DISPLAY nvcr.io/nvidia/dli/dli-nano-ai-cam /bin/bash

```
