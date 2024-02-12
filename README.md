# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation

Clone repository or launch in codespace.

Install dépendencies
```bash
  $ bundle install faker
  $ bundle install table_print
```
Install Database : create tables and seed
```bash
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
```
To launch Rails console
```bash
  $ rails c
```
Print tables in Rails console
```bash
  tp City.all
```
