FROM condaforge/mambaforge:latest

WORKDIR /tmp

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update
RUN apt-get -y install gcc inkscape wget
ADD ./freesurfer_ubuntu20-7.4.1_amd64.deb .
RUN apt-get -y install ./freesurfer_ubuntu20-7.4.1_amd64.deb
RUN mamba create -y -n ctx python=3.9 ipykernel jupyter numpy pandas matplotlib
RUN mamba init
RUN /opt/conda/envs/ctx/bin/pip install -U pip
RUN /opt/conda/envs/ctx/bin/pip install -U pycortex
