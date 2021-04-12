FROM ubuntu:20.04 AS build

# GNU compiler
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        g++ \
        gcc \
        gfortran && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        grace \
        make \
        python \
        vim \
        wget && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b cam_cesm2_1_rel_05-Nor_v1.0.2 https://github.com/NorESMhub/CAM.git /opt/uio/my_sandbox

RUN mkdir -p /opt/uio/AeroTab

COPY create_sw_lut /opt/uio/

COPY create_lw_lut /opt/uio/

COPY create_lnf_lut /opt/uio/


