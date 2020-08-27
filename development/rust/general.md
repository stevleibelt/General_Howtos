# The Package Manager Cargo

## Install it

Preferred way is to use your distribution packagemanager.
But if you have to do it on your own, follow this guide.

```
#fetch rustup.rs from https://sh.rustup.rs/
#@see https://www.rust-lang.org/tools/install
sh ./rustup.rs

#you should also add this path to your PATH variable
source $HOME/.cargo/env

#check that all is working and that are both having the almost same version
cargo --version
rustc --version
```

## Hello World

```
echo 'fn main() {println!("Hello World"); }' > hello_world.rs

rustc hello_world.rs

./hello_world
```

## Basic commands

```
#create new package
#   this will create a directory and file structure inside your current working directory
#   use `tree` inspect the result
#if you want to create a libary, add --lib
cargo new <my_package>
#Adapt the Cargo.toml and main.rs file as you want it.
#The Cargo.toml file is used to add dependencies

#build package
#cd int your package
#the build result should be located in `target/debug/<my_package>`
#the build process is also fetching and adding all declared dependencies
#if you want to rebuild stuff, clean the files from old data
cargo clean
cargo build

#run your package/application+
#cd int your package
cargo run

#update dependencies
#all
cargo update
#just one
cargo update -p <package_name>

#run tests
cargo test
```

# Links

* [The Cargo Book](https://doc.rust-lang.org/stable/cargo/) - 2020-03-03
* [Getting started with the Rust pacage manager, Cargo](https://opensource.com/article/20/3/rust-cargo) - 2020-03-03
