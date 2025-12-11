FROM cm2network/steamcmd:latest

RUN mkdir -p "/home/steam/Steam/steamapps/common/Project Zomboid Dedicated Server" && \
    chown -R steam:steam /home/steam/Steam

COPY --chown=steam:steam --chmod=755 entrypoint.sh /entrypoint.sh

EXPOSE 16261/udp 16262/udp

ENTRYPOINT ["/entrypoint.sh"]