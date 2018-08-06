FROM ppc64le/ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
ADD id_rsa.pub /root/.ssh/authorized_keys

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH=/usr/lib/nvidia-390" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
