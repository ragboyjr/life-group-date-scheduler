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


## Testing

This project uses rspec and the rspec rails integration.

Run the tests with:

`bundle exec rspec`

rspec looks for spec files within the src directory currently.

## Domain Design

Right now, the app and domain layer are within the src directory under the LGDS namespace.

All Infra and UI code is just apart of the standard rails app in the app dir.