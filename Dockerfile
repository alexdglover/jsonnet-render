# TODO: Create an image that includes Jsonnet, rather than fetching it on launch
FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
