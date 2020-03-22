FROM ubuntu:20.04

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get update && \
    apt-get install -y wget
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
USER ubuntu
ENV PYTHONDONTWRITEBYTECODE=true
ENV PATH /home/ubuntu/local/bin:$PATH
ENV PATH /home/ubuntu/miniconda/bin:$PATH
WORKDIR /home/ubuntu
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p $HOME/miniconda && \
    mkdir -p /home/ubuntu/local/bin
ADD --chown=ubuntu:root bin/ /home/ubuntu/local/bin
COPY environment.yml /home/ubuntu/environment.yml
RUN eval "$(/home/ubuntu/miniconda/bin/conda shell.bash hook)" && \
    conda init && \
    conda env create -f environment.yml && \
    conda clean -afy && \
    find /home/ubuntu/miniconda/ -follow -type f -name '*.a' -delete && \
    find /home/ubuntu/miniconda/ -follow -type f -name '*.pyc' -delete && \
    find /home/ubuntu/miniconda/ -follow -type f -name '*.js.map' -delete && \
    echo "conda activate lab" >> ~/.bashrc && \
    rm ~/miniconda.sh && \
    mkdir ~/notebooks && \
    chmod +x /home/ubuntu/local/bin/notebooks
CMD ["notebooks"]