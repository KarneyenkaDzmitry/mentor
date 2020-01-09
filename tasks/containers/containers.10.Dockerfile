FROM nginx

LABEL STUDENT=Karneyenka

RUN apt-get update && apt-get install -y curl && apt-get clean

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=10s --retries=5 --start-period=5s \
    CMD "curl -sS http://localhost:80 || exit 1"

ENTRYPOINT ["nginx",  "-g", "daemon off;"]
