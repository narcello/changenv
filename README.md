
# :dizzy: changenv

Change environment vars after build


[![NPM Version](https://img.shields.io/npm/v/changenv?logo=npm)]()
[![NPM Downloads](https://img.shields.io/npm/dw/changenv?logo=npm)]()

  
## :dart: Motivation: *Dead Components*

Sometimes in project, with so specific architecture on build the env vars aren't change.

  
## :computer: Tech

Just bash :)


## :inbox_tray: Install

* Npm

```sh

npm i -g changenv

```

* Yarn

```sh

yarn add changenv

```
  

## :hammer: Usage

```bash

changenv <environment> <path_to_folder>

```

Changenv will looking for `.env.<environment>` file, read it, and for each var, change every match with `process.env.<env_var_name>` on `<path_to_folder>` with their value.


## :zap: Examples

```bash

changenv production ./build

```

```bash

changenv staging ./lib

```

```bash

changenv development ./dist

```