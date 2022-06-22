# Rustup

## Install rust tollchain without using your distribution package

```bash
#download install script
curl --proto '=https' --tlsv1.2 \ -sSf https://sh.rustup.rs > sh.rustup.rs

#execute install script
bash sh.rustup.rs

#source environment
source ${HOME}/.cargo/env

#verify all is running
rustc --version
cargo --version
```

## Usage

```bash
#show available and active toolchains
rustup show

#show current default toolchain
rustup default

#switch between toolchains
rustup default <toolchain>

#show paths
rustup which rustc
rustup which cargo

#update and upgrade
rustup check
rustup update

#help
rustup --help
rustup doc --book
rustup doc --std
rustup doc --cargo
```

## Links

* [Manage your Rust toolchain using rustup](https://opensource.com/article/22/6/rust-toolchain-rustup) - 20220622T12:12:30

