build: ; rm -rf dist && mkdir dist && dart compile exe bin/caml.dart && mv bin/caml.exe dist && mv dist/caml.exe dist/caml.bin
test: ;  dart pub get && dart analyze . && make build && cd dist && chmod a+x caml.bin && ./caml.bin --version && ./caml.bin --help
