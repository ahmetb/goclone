# `goclone`

This tool helps you clone GitHub repositories and set $GOPATH correctly
with Godeps paths etc.

It determines whether the repo uses Godeps smartly.

### Usage
```
$ goclone https://github.com/mesosphere/mesos-dns
Running: git clone -q https://github.com/mesosphere/mesos-dns.git /Users/alp/workspace/gopath-mesos-dns/src/github.com/mesosphere/mesos-dns
Cloned mesos-dns!

Run the following to set $GOPATH:
    cd /Users/alp/workspace/gopath-mesos-dns/src/github.com/mesosphere/mesos-dns
    export GOPATH=/Users/alp/workspace/gopath-mesos-dns/src/github.com/mesosphere/mesos-dns/Godeps/_workspace:/Users/alp/workspace/gopath-mesos-dns
```

or more conveniently the following will put you to the project folder and set GOPATH even though the project was cloned once before:

```
$ eval $(goclone https://github.com/mesosphere/mesos-dns)
```

### Installation

Copy `goclone` script to your `/usr/local/bin/goclone` and `chmod +x` it.

## Author

Ahmet Alp Balkan [@ahmetalpbalkan](https://github.com/ahmetalpbalkan)
