# Example web server log parser

This simple Ruby application takes a log file, produced to a specific format, and outputs useful metrics in a human-readable format:

* Most page views
* Must unique page views

## Installing dependencies

You should use Ruby 2.5.3 to run the application, which is the current stable build. Other versions are untested. If you are using [rvm](http://rvm.io):

  `rvm install "ruby-2.5.3"`

Then install the gem libraries:

  `bundle install`

## Usage

The input log file must be of a specific format: one line per logged request, with the full request path and the remote IP address only, separated by a space.

## Running tests

Ensure the Gem library dependencies are installed (see above), and then execute the tests:

  `bundle exec rspec`

## To do

Things which could improve the application on further iterations:

* More sanity checking of the input file
* Options for the user to choose more output formats e.g. ascending/descending, only certain metrics
* Use of a database server e.g. SQLite, Redis, for better performance on larger files
