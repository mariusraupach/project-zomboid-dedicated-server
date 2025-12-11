FROM cm2network/steamcmd:latest

COPY --chown=steam:steam --chmod=755 entrypoint.sh /entrypoint.sh

EXPOSE 16261/udp 16262/udp

ENTRYPOINT ["/entrypoint.sh"]