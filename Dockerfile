FROM golang:1.7
RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/smartcaas/agent.git \
&& cd agent \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/agent/
COPY cfg.json $GOPATH/src/github.com/dinp/agent/cfg.json
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN ln -s /lib/x86_64-linux-gnu/libdevmapper.so.1.02.1 /lib/x86_64-linux-gnu/libdevmapper.so.1.02
CMD ["/run.sh"]
