export GO_TMP=$(mktemp -udt go-arm-bootstrap)
echo $GO_TMP
mkdir -p $GO_TMP
cd $GO_TMP
curl -Ls https://golang.org/dl/go1.15.6.darwin-amd64.tar.gz | tar -xjf -
git clone https://go.googlesource.com/go $GO_TMP/go-bootstrap
cd $GO_TMP/go-bootstrap/src
arch --x86_64 env GOROOT_BOOTSTRAP=$GO_TMP/go GODEBUG=asyncpreemptoff=1 GOOS=darwin GOARCH=arm64 ./bootstrap.bash
export GO_RUNTIME=$GO_TMP/go-runtime
git clone https://go.googlesource.com/go $GO_RUNTIME
cd $GO_RUNTIME/src
arch --arm64e env GOROOT_BOOTSTRAP=$GO_TMP/go-darwin-arm64-bootstrap ./make.bash
sudo mkdir /usr/local/opt
sudo --preserve-env=GO_RUNTIME zsh -c 'mv $GO_RUNTIME /usr/local/opt/go && chown -R root:wheel /usr/local/opt/go'
mkdir ~/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/bin:$GOPATH/bin
go version
