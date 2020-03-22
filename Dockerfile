FROM ubuntu:20.04

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get update && \
    apt-get install -y wget
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
USER ubuntu
WORKDIR /home/ubuntu
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda
COPY environment.yml /home/ubuntu/environment.yml
RUN eval "$(/home/ubuntu/miniconda/bin/conda shell.bash hook)" && \
    conda init
ENV PATH /home/ubuntu/miniconda/bin:$PATH
RUN conda env create -f environment.yml
RUN echo "conda activate lab" >> ~/.bashrc && \
    rm ~/miniconda.sh && \
    mkdir ~/notebooks && \
    mkdir -p /home/ubuntu/local/bin
ENV PATH /home/ubuntu/local/bin:$PATH
ADD --chown=ubuntu:root bin/ /home/ubuntu/local/bin
RUN chmod +x /home/ubuntu/local/bin/notebooks
CMD ["notebooks"]