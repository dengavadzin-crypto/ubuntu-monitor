FROM ubuntu:latest
RUN apt-get update && apt-get install -y procps coreutils && rm -rf /var/lib/apt/lists/*
COPY sys_stat.sh /usr/local/bin/sys_stat.sh
RUN chmod +x /usr/local/bin/sys_stat.sh
CMD ["/usr/local/bin/sys_stat.sh"]
