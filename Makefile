build: ; rm -rf dist && mkdir dist && dart compile exe bin/caml.dart && mv bin/caml.exe dist && mv dist/caml.exe dist/caml
test: ;  dart pub get && dart analyze . && make build && cp -f exampleFile/test.caml dist && cd dist && chmod a+x caml && ./caml --version && ./caml --help
