FROM centos:7

WORKDIR /python_api
RUN yum -y --enablerepo=extras install epel-release && yum clean all && yum -y update
RUN wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz && tar xzf Python-3.7.2.tgz
RUN cd Python-3.7.2 && ./configure --enable-optimizations && make altinstall && cd ..
RUN python -m ensurepip --upgrade
COPY requirenments.txt requirenments.txt
RUN pip3 install -r requirenments.txt
COPY python-api.py /python_api/python-api.py
ENTRYPOINT ["python3", "python-api.py"]