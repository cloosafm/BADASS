FROM alpine:3.21.2
RUN apk update 
RUN apk add --no-cache bash iputils tcpdump