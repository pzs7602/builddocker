## README.md
this dockerfile can be used to build docker image for jetson nano. the image container uses CSI camera to capture video.

## build docker image
```
sudo docker build -t dli-nano-ai-cam -f camera.Dockerfile
```
## run docker image
```
#run xhost + in host machine and then run docker image:
sudo docker run --runtime nvidia -it --network host  --volume /tmp/argus_socket:/tmp/argus_socket --device /dev/video0 -e DISPLAY=$DISPLAY dli-nano-ai-pzs:nano /bin/bash

```
