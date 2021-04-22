build: ; rm -rf dist && mkdir dist && dart compile exe bin/caml.dart && mv bin/caml.exe dist && mv dist/caml.exe dist/caml.bin
basic_test: ;  dart pub get && dart analyze . && make build && chmod a+x caml.bin && ./caml.bin --version && ./caml.bin --help
adanced_test: ; echo "Hello World!"
