# swiftTox

A description of this package.



`TARGETS`  > `Build Settings` >  `Library Search Paths` `/usr/local/Cellar/libtoxcore/0.2.4/lib`



```sh
mkdir -p ~/Documents/Github/swift
cd ~/Documents/Github/swift-demo/spm
swift package init

brew tap Tox/tox
brew install --HEAD tox/tox/libtoxcore


swift build
swift test
swift package generate-xcodeproj
```
