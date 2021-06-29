# 2.5 hours to build this image
# run this image: sudo docker run --runtime nvidia -it --network host  --volume /tmp/argus_socket:/tmp/argus_socket --device /dev/video0 -e DISPLAY=$DISPLAY dli-nano-ai-pzs /bin/bash
FROM nvcr.io/nvidia/dli/dli-nano-ai:v2.0.1-r32.5.0
RUN apt-get update && apt-get upgrade -y && apt install python3-pip pkg-config cmake libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran libcanberra-gtk-module sudo nano -y

#COPY ./CSI-Camera /home/CSI-Camera
#COPY ./tensorrt_demos /home/tensorrt_demos

WORKDIR /home/CSI-Camera
RUN pip3 install -U pip
RUN pip3 install numpy==1.18.1 scikit-learn pillow testresources setuptools==49.6.0 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.3.3 futures protobuf pybind11 tensorflow-2.3.1+nv20.12-cp36-cp36m-linux_aarch64.whl matplotlib -i https://pypi.tuna.tsinghua.edu.cn/simple/
ENV PATH="/root/.cargo/bin:${PATH}"
RUN sh sh.rustup.rs -y && . /root/.cargo/env
RUN pip3 install tokenizers==0.10.3 transformers

RUN echo "export PATH=/usr/local/cuda/bin:${PATH}" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}" >> /root/.bashrc
RUN echo "export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1:${LD_PRELOAD}" >> /root/.bashrc
