# README

TPO School API

## Dependencies

- ruby version 2.6.5   `rvm install "ruby-2.6.5"`
- docker

## Install

```sh
git clone git@github.com:mberrueta/uade_integracion_tpo.git
cd uade_integracion_tpo
docker-compose -d up
bundle install
```

## Add Model

```sh
rails generate migration AddXXXModel
rails db:migrate
# rails db:rollback to revert and go back
```
