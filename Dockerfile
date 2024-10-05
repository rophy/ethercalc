FROM node:18.20.4-bullseye

ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN useradd ethercalc -m -d /app
WORKDIR /app
USER ethercalc
COPY --chown=ethercalc . .
RUN npm install -c --omit=dev
EXPOSE 8000
CMD ["node", "bin/ethercalc"]
