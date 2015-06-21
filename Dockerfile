FROM golang:1.4
RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/dinp/agent.git \
&& cd agent \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/agent/
COPY cfg.json $GOPATH/src/github.com/dinp/agent/cfg.json
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
