# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Reset Data

```
bundle exec rails db:migrate:reset
bundle exec rails c
irb> House.import_csv
irb> Energy.import_csv
```
