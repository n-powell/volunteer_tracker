# _Volunteer Tracker_

### _Non-profit volunteer tracker_
### _May 5, 2017_


### Description

This is a tracker for volunteers and projects for a small non-profit. This page is designed to store information regarding volunteers association with particular projects.

## Simple Setup/Install

* _Clone directory from github using git_
* _Navigate into downloaded directory file using a terminal or your operating systems GUI finder_
* _Download and install Ruby and the Sinatra Gem_
* _Navigate directory and open using ruby app.rb_
* _Using a web browser, type in the url localhost:4567_

# Detailed install and run instructions

* _Ensure you have postgres and psql installed on your machine_

* _First run postgres in terminal by running $postgres_

* _Now run psql in terminal by running $psql_

* _create a database by running $CREATE DATABASE volunteer_tracker;_

* _load psql database with the following code in terminal after starting psql by running $psql:_


CREATE TABLE "projects" (
"id"  SERIAL ,
"name" VARCHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "volunteers" (
"id"  SERIAL ,
"name" VARCHAR ,
"project_id" INTEGER ,
PRIMARY KEY ("id")
);_

* _Note: This next step must only be done after your first main database in made because the next test database is a templat or "clone" of the current details of the main database. This includes the database name, tables, column names, and their corresponding data types._

* _Secondary Note: This test database is created for all testing use as to not create any info to be stored in intended project critical main database._

* _create a test database by running CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;_

* _Navigate to cloned project folder in terminal_

* _Run the sinatra launcher typing in the terminal $ ruby app.rb_

* _open your web browser and type in the url path localhost:4567_


## Built With

* Ruby
* Sinatra
* Bundler gem
* HTML
* CSS
* Bootstrap
* postgres
* SQL



## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|As a non-profit employee, I want to add projects.|Add: Tree Planting|Projects: Tree Planting|
|As a non-profit employee, I want delete projects.|Delete: Tree Planting|Projects: []|
|As a non-profit employee, I want to update projects.|Update: Tree Planting with kids|Projects: Tree Planting with kids|
|As a non-profit employee, I want to add volunteers.|Add: Franklin|Volunteers: Franklin|
|As a non-profit employee, I want delete volunteers.|Delete: Franklin|Volunteers: []|
|As a non-profit employee, I want to update volunteers.|Update: Franklin Jones|Volunteers: Franklin Jones|
|As a non-profit employee, I want to add volunteers to a project.|Add: Franklin To: Tree Planting| Project: Tree Planting Volunteers: Franklin|
## Authors

* Nick Powell

## License

Copyright © 2017 Nick Powell
