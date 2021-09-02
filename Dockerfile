FROM i2bskn/golang:latest

ENV GO111MODULE on

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 \
    wget \
		unzip \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/google/protobuf/releases/download/v3.17.3/protoc-3.17.3-linux-x86_64.zip \
  && unzip protoc-3.17.3-linux-x86_64.zip -d /usr/local \
  && rm -f protoc-3.17.3-linux-x86_64.zip
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26 \
  && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
RUN wget https://github.com/pseudomuto/protoc-gen-doc/releases/download/v1.5.0/protoc-gen-doc-1.5.0.linux-amd64.go1.16.6.tar.gz \
  && tar zxf protoc-gen-doc-1.5.0.linux-amd64.go1.16.6.tar.gz \
  && mv protoc-gen-doc-1.5.0.linux-amd64.go1.16.6/protoc-gen-doc /usr/local/bin/ \
  && rm -rf protoc-gen-doc-1.5.0.linux-amd64.go1.16.6.tar.gz protoc-gen-doc-1.5.0.linux-amd64.go1.16.6
