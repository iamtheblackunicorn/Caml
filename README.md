# CAML :camel:

[![GitHub CI](https://github.com/iamtheblackunicorn/Caml/actions/workflows/dart.yml/badge.svg)](https://github.com/iamtheblackunicorn/Caml/actions)

*A simple new data-storing format for Dart nerds and simplicity enthusiasts.* :camel:

## About :books:

I've always wanted my own data formate like `YAML` or `JSON`.
*Caml* is the Black Unicorn's data-storing format.

## Using the library :pick:

### From GitHub

Add the library to your `pubspec.yaml` by adding this to it:

```YAML
dependencies:
  caml:
    git: git://github.com/iamtheblackunicorn/Caml.git
```

### Importing the API

Import the API like this:

```dart
import 'package:caml/caml.dart';
```

## Building :hammer_and_pick:

### Prerequisites
Make sure you have the following programmes installed:

- GNU Make
- Git
- Dart SDK

### Build it!

- 1.) Get the latest source code:

```bash
$ git clone https://github.com/iamtheblackunicorn/Caml.git
```

- 2.) Change into the source directory's root:

```bash
$ cd Bake
```

- 3.) Compile an executable:

```bash
$ make build
```
## Installation :inbox_tray:

### Linux & Mac OSX

Add this line to your `.zshrc`, `.bashrc` or `.bash_profile` in `$HOME`:

```bash
export PATH="$HOME/blackunicorn/bin:$PATH"
```
After having done that, create a directory called `blackunicorn` in `$HOME` and in `blackunicorn` a directory called `bin`.

### Windows

Go to your "System Settings", go to "This PC" or "My PC" and right-click that entry. Then go to "Edit Environment Variables".
Add this line to the dialog that appears:

```
C:\blackunicorn\bin
```

Save that and quit the "System Settings". After having done that, go to the File Explorer and create a directory called `blackunicorn` in `C:\` and in `blackunicorn` a directory called `bin`.

### Finally

After you have configured the `$PATH`on your system, move the `caml` executable to `blackunicorn/bin`. You may need to run `chmod a+x` on the binary executable before being able to call it from the console.

## Tutorial :pick:

Here's how you get started with *Caml*!

- Create a file called `example.caml`:

```text
$ touch example.caml
```

- Put some data into it:

```text
"name" => "The Black Unicorn"
```

- Convert the data to JSON:

```bash
$ caml --toJSON example.caml
```

This will output a file called `example.json`. This will be its contents:

```JSON
{
  "name": "The Black Unicorn"
}
```

- Convert the JSON file to a *Caml* data file:

```bash
$ caml --toCAML example.json
```
This will output a file called `example.caml`. This will be its contents:

```text
"name" => "The Black Unicorn"
```

Pretty neat, right?

## Note
- *Caml :camel:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
