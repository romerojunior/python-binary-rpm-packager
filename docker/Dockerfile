FROM centos:7
LABEL maintainer="Romero Galiza Jr <rgaliza@schubergphilis.com>"
# os deps:
RUN yum install -y rpm-build createrepo ruby-devel gcc make rubygems \
  && yum clean all \
  && rm -rf /var/cache/yum
# python deps:
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
  && python get-pip.py \
  && pip install awscli boto3 pyinstaller \
  && rm -rf get-pip.py
# ruby deps:
RUN gem install --no-document fpm