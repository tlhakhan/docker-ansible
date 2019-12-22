FROM docker.repo.tenzin.io/tlhakhan/centos:7

# install development tools
RUN yum install -y vim vim-enahnced vim-filesystem vim-jellybeans wget openssh-clients git

# install python3 and upgrade pip
RUN yum install -y python3 && \
    pip3 install -U pip

# send over the requirements for virtualenv
COPY requirements.txt /requirements.txt

# create a virtual env that will hold python packages
RUN python3 -m venv /python-env && \
    source /python-env/bin/activate && \
    pip install -U pip && \
    pip install -r /requirements.txt

RUN echo 'source /python-env/bin/activate' >> /root/.bashrc

WORKDIR /ansible
