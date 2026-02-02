# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
   3.4.5
  
* System dependencies
  Rails 7.x
SQLite3 / PostgreSQL
Redis (for Active Job background processing)

* Configuration
Nested Forms: Configured accepts_nested_attributes_for in models.

* Database creation
 rails db:create
 rails db:migrate
 rails db:seed

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
Active Job Backend: Handles background mailers and bulk data tasks.
Action Mailer: Optimized with .deliver_later and localized templates.

* Deployment instructions

* ...
