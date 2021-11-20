FROM node:latest
# ### ^^ installs node.js

# ### install python
RUN apt-get update && \
    apt-get install -y python

# ### install swipl (swi-prolog)
## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## preseed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select America" > /tmp/preseed.txt ; \
    echo "tzdata tzdata/Zones/America select Toronto" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
    
RUN   apt-get update && \
      apt-get install -y swi-prolog

#RUN   apt-get install -y emacs && \
#      apt-get install -y snapd && \
#      snap install drawio
RUN   apt-get install -y emacs

RUN mkdir /app && \
    cd /app && \
    git clone https://github.com/guitarvydas/vsh.git && \
    git clone https://github.com/guitarvydas/d2f.git && \
    git clone https://github.com/guitarvydas/pfr.git && \
    git clone https://github.com/guitarvydas/appbin.git

RUN cd /app && \
    npm install atob \
    npm install pako \
    npm install ohm-js
    
ENV PATH="/app/appbin:${PATH}"

ENTRYPOINT ["/bin/bash"]