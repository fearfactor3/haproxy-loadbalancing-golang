FROM golang:1.24-alpine

# Create working directory under /app
WORKDIR /app

# Copy over all go config (go.mod, go.sum) files
COPY proxy/go.* ./

# Install any required modules
ENV GO111MODULE=on
RUN go mod download

# Copy over Go source code
COPY proxy/*.go ./

# Run the Go build and output binary under hello_go_http
RUN go build -o /proxy

# Run the app binary when the container starts
ENTRYPOINT [ "/proxy" ]
