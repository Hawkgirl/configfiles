FROM ppc64le/ubuntu
RUN apt-get update && apt-get install -y openssh-server supervisor python-dateutil cron
RUN mkdir -p /var/run/sshd /var/log/supervisor
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:root123' | chpasswd
RUN echo 'export TMOUT=180' >> /root/.bashrc
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY shutdown.py /usr/bin/shutdown.py

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


RUN touch /var/log/cron.log
RUN echo '* * * * * root /usr/bin/shutdown.py >> /var/log/cron.log 2>&1' > /etc/cron.d/mycron
RUN echo '#empty line' >> /etc/cron.d/mycron
RUN chmod 0644 /etc/cron.d/mycron

RUN rm /var/log/lastlog
RUN rm /var/log/wtmp
RUN touch /var/log/wtmp

EXPOSE 22
CMD ["/usr/bin/supervisord"]
