FROM fbarilla/powerai-r5-pdp
#remove PATH line in bashrc on this image as it spoils PATH env varible
RUN sed -i '/PATH/d' /root/.bashrc
ARG ssh_password=root123
RUN echo "root:${ssh_password}" | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN ssh-keygen -A

ADD id_rsa.pub /root/.ssh/authorized_keys
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "export PATH=$PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/profile
RUN echo "export CUDA_VERSION=8.0" >> /etc/profile
RUN echo "export CUDA_PKG_VERSION=8-0=8.0.61-1" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64" >> /etc/profile
RUN echo "export LIBRARY_PATH=/usr/local/cuda/lib64/stubs" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
