# `goclone(1)`

![goclone(1) demo screencast](demo.gif)

**goclone** is a tool to clone Go repositories from GitHub and other sources to
a clean `$GOPATH` and start working on them right away. No more turning your
`~/go` into a hot mess.

### Examples

Clone `ahmetb/govvv` from GitHub, and start a new shell:

    $ goclone ahmetb/govvv

Clone `k8s.io/kubernetes` and run `cat LICENSE` in its directory.

    $ goclone k8s.io/kubernetes -- cat LICENSE

Clone `https://github.com/rakyll/gops` and set GOPATH/PWD in the current shell:

    $ eval $(goclone -q https://github.com/rakyll/gops)

## Features

- Creates clean GOPATH for each project, no more dependency version conflicts!
- Supports [`hub(1)`](https://hub.github.com/) tool if present. This allows
  cloning of private repositories.
- Supports various formats for cloning repositories:
    - `ahmetb/govvv`: GitHub repo name
    - `git@github.com:user/repo.git`: GitHub SSH format (works w/ private repos)
    - `https://github.com/rakyll/hey`: GitHub URL, pasted from web browser
    - `gopkg.in/mgo.v2`: Go import path, does not have to be GitHub
- Spawns a new shell with GOPATH/PWD correctly set.
- `$GOPATH/bin` value is provided in the new shell through the `$EXTRA_PATH`
  variable. You can use this to add your binaries to your `$PATH` automatically.

## Installation

Download [`goclone`](./goclone) file to your `/usr/local/bin` and `chmod +x` it.

One-line install script for macOS/Linux:

```sh
sudo wget -qO/usr/local/bin/goclone \
      https://rawgit.com/ahmetb/goclone/master/goclone && \
    sudo chmod +x /usr/local/bin/goclone
```

 **Optional:** goclone provides an `$EXTRA_PATH` env var, pointing to the
`$GOPATH/bin`. Use the following in your .bashrc/.zshrc file to add it to your
`$PATH` when the goclone shell starts:

    if [ -n "$EXTRA_PATH" ]; then export PATH="$EXTRA_PATH:$PATH"; fi

-----

Brought to you by [@ahmetb](https://github.com/ahmetb).
