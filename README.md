# nvim-setup

## Install Neovim

```
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt update -y
$ sudo apt install neovim
```

## Install Lua

```
$ mkdir lua_build
$ cd lua_build
$ curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
$ tar zxf lua-5.4.4.tar.gz
$ cd lua-5.4.4
$ make linux test
$ sudo make install
```
