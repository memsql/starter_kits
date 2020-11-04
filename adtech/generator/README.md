# Data Generator

This program generated the data sets in S3 bucket `reference-solutions.memsql.com`. Normally you do not need to regenerate these sets, but we have provided the code in case you want to change the output format or create larger test sets.

# Installing the Go compiler

## macOS

Download from https://golang.org/dl/.

## Red Hat, CentOS, Fedora

```bash
sudo yum install -y golang
```

## Debian, Ubuntu, PopOS

```bash
sudo apt-get -y update && apt-get -y install golang
```

# Building the Generator

If you want to build the generator for macOS, set the following the environment variable:

```bash
export GOOS=darwin
```

If you want to build the generator for GNU/Linux, set the following environment variable:

```bash
export GOOS=linux
```

Then build and run the generator:

```bash
export GOPATH=$HOME/go
mkdir -p $GOPATH
go get
go build
./generator large
pigz *.tsv
```

The generator takes a single parameter, which must be one of `small`, `medium`, or `large`. The output is several tab-separated value (TSV) files. You may wish to compress them with `gzip` to save space.
