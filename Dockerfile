FROM ubuntu:20.04
ENV TERM vt100

RUN apt update && apt dist-upgrade -y
RUN apt install -y python3-pip python3-setuptools curl dialog
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install lektor
COPY run.sh /usr/bin
# RUN curl -sf https://raw.githubusercontent.com/lektor/lektor/5f2c070f6c89df5fbfb6cdf8c539207b925c59d8/bin/install.py | python

WORKDIR /site
EXPOSE 5000

ENTRYPOINT ["/usr/bin/run.sh"]

