# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# create the user
RUN useradd -r -s /bin/false helloworld
# Go get and build
#RUN go get github.com/verymail/go-hello.git
# RUN go install github.com/willejs/go-hello-world
COPY * /home/
RUN pwd
RUN bash -c 'cd /home/ ; go build -o gohell'

# Run the service
ENTRYPOINT /home/gohell

# Document that the service listens on port 8080.
EXPOSE 80