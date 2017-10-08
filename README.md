# `goclone(1)`

**goclone** is a tool to clone Go repositories from GitHub and other sources to
a new `$GOPATH` and start working on it right away.

For example, running `goclone sirupsen/logrus` clones the
[logrus](https://github.com/sirupsen/logrus) repository to a clean `$GOPATH` at
`~/workspace/gopath-logrus` and starts a new shell session for you to hack on
it.

This way you stop using a global `$GOPATH` that turns into a pile of garbage
over time. Now you can easily download a Go project and its dependencies, and
remove it all very easily

**goclone** supports private repositories on GitHub, using the
[hub](https://hub.github.com/) tool.

### Examples

Clone `ahmetb/govvv` from GitHub, and start a new shell:

    $ goclone ahmetb/govvv

Clone `k8s.io/kubernetes` and run `cat LICENSE` in its directory.

    $ goclone k8s.io/kubernetes -- cat LICENSE

Clone `https://github.com/rakyll/gops` and set GOPATH/PWD in the current shell:

    $ eval $(goclone -q https://github.com/rakyll/gops)

### Installation

Download [`goclone`](./goclone) file to your `/usr/local/bin` and `chmod +x` it. 

One-line install script for macOS/Linux:

```sh
sudo wget -qO/usr/local/bin/goclone \
      https://rawgit.com/ahmetb/goclone/master/goclone && \
    sudo chmod +x /usr/local/bin/goclone
```

-----

Brought you by [@ahmetb](https://github.com/ahmetb).
