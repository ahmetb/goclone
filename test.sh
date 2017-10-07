#!/bin/bash

tmp_workspace="$(mktemp -d)"
set -e
(
    export WORKSPACE="${tmp_workspace}"
    set -ex

    (
        export FORCE_GIT=1

         # github http(s) WITHOUT hub(1)
        ./goclon https://github.com/rakyll/gops
        test -f "$WORKSPACE/gopath-gops/src/github.com/rakyll/gops/gops.go"
        echo

        # github ssh WITHOUT hub(1)
        ./goclon git@github.com:pkg/errors.git
        test -f "$WORKSPACE/gopath-errors/src/github.com/pkg/errors/errors.go"
        echo
    )

    # github a/b format
    ./goclon sirupsen/logrus
    test -f "$WORKSPACE/gopath-logrus/src/github.com/sirupsen/logrus/doc.go"
    echo

    # github http(s) with hub(1)
    test -x "$(command -v hub)" 
    ./goclon https://github.com/rakyll/gom
    test -f "$WORKSPACE/gopath-gom/src/github.com/rakyll/gom/cmd/gom/gom.go"
    echo

    ./goclon https://github.com/GoogleCloudPlatform/govanityurls.git
    test -f "$WORKSPACE/gopath-govanityurls/src/github.com/GoogleCloudPlatform/govanityurls/main.go"
    echo

    # github ssh with hub(1)
    test -x "$(command -v hub)"
    ./goclon git@github.com:jingweno/ccat.git
    test -f "$WORKSPACE/gopath-ccat/src/github.com/jingweno/ccat/main.go"
    echo

    # go-get format
    ./goclon gopkg.in/mgo.v2
    test -f "$WORKSPACE/gopath-gopkg-in-mgo-v2/src/gopkg.in/mgo.v2/doc.go"
    echo

    # clone-again doesn't run again
    ./goclon git@github.com:jingweno/ccat.git
    echo
    ./goclon gopkg.in/mgo.v2
    echo
)
(
    # cleanup
    set -x
    rm -rf "${tmp_workspace}"
)
echo "SUCCESS"
