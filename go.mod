module github.com/owncloud/ocis

go 1.13

require (
	contrib.go.opencensus.io/exporter/jaeger v0.2.0
	contrib.go.opencensus.io/exporter/ocagent v0.6.0
	contrib.go.opencensus.io/exporter/zipkin v0.1.1
	github.com/UnnoTed/fileb0x v1.1.4
	github.com/chzyer/logex v1.1.10 // indirect
	github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1 // indirect
	github.com/gogo/protobuf v1.3.1 // indirect
	github.com/grpc-ecosystem/grpc-gateway v1.12.1 // indirect
	github.com/micro/cli/v2 v2.1.2-0.20200203150404-894195727d9c
	github.com/micro/go-micro/v2 v2.0.1-0.20200212105717-d76baf59de2e
	github.com/micro/micro/v2 v2.0.1-0.20200210100719-f38a1d8d5348
	github.com/openzipkin/zipkin-go v0.2.2
	github.com/owncloud/flaex v0.2.0
	github.com/owncloud/ocis-accounts v0.1.1
	github.com/owncloud/ocis-glauth v0.4.0
	github.com/owncloud/ocis-graph v0.0.0-20200318175820-9a5a6e029db7
	github.com/owncloud/ocis-graph-explorer v0.0.0-20200210111049-017eeb40dc0c
	github.com/owncloud/ocis-hello v0.1.0-alpha1.0.20200207094758-c866cafca7e5
	github.com/owncloud/ocis-konnectd v0.3.1
	github.com/owncloud/ocis-migration v0.0.0-20200504185909-72274a4f1449
	github.com/owncloud/ocis-ocs v0.0.0-20200318181133-cc66a0531da7
	github.com/owncloud/ocis-phoenix v0.6.0
	github.com/owncloud/ocis-pkg/v2 v2.2.1
	github.com/owncloud/ocis-proxy v0.3.1
	github.com/owncloud/ocis-reva v0.2.2-0.20200513073117-ee9cd9b8d3ab
	github.com/owncloud/ocis-thumbnails v0.1.2-0.20200422124828-f92a40879feb
	github.com/owncloud/ocis-webdav v0.1.0
	github.com/restic/calens v0.2.0
	go.opencensus.io v0.22.3
	go.uber.org/atomic v1.5.1 // indirect
	go.uber.org/multierr v1.4.0 // indirect
	golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae // indirect
)

replace google.golang.org/grpc => google.golang.org/grpc v1.26.0
