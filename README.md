# README

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

## System dependencies
  - [Ruby](https://www.ruby-lang.org/ko/)
    - 2.4.0
  - [Ruby on Rails](http://guides.rubyonrails.org/getting_started.html)
    - 5.0.0
  - [MySQL](https://www.mysql.com/)
    - 5.7.17
    
## Let's start building

#### Install dependencies
  1. Install Ruby on Rails
    - https://github.com/aria-grande/ggida/wiki/About-Ruby-on-Rails
  2. Install mysql and set up the database
    - https://www.mysql.com/downloads/
    
#### Set up the project
  3. Clone the source
  4. Set up database information in config/database.yml
  5. Go to home directory
  6. Install gems by running `bundle install`
  7. Create database by running `rails db:create`
  8. Migrate database schema by running `rails db:migrate`
  9. Set initial data by running `rails db:seed`
  
#### Launch a server
  10. `rails server`
    - reference [Rails CLI](http://guides.rubyonrails.org/command_line.html)
  11. Get a greeting from [http://localhost:3000](http://localhost:3000)
  
  
## Database
### creation
  - `rails db:create`

### initialization
  - `rails db:seed`
  - (or created alongside the database with `rake db:setup`)
  
### migration
  - `rails db:migrate`

### schema
  - `annotate -m`
    - writes schema into {model}.rb using [annotate_models](https://github.com/ctran/annotate_models)

## Routes
  - `rake routes`
  - `annotate -r`
    - writes route infos into routes.rb using [annotate_models](https://github.com/ctran/annotate_models)

## Test 
  - `rake test`
  - Reference http://guides.rubyonrails.org/testing.html

## Reference
  - use different version of ruby per project
    - https://makandracards.com/makandra/21545-rbenv-how-to-switch-to-another-ruby-version-temporarily-per-project-or-globally
  - Rails CLI
    - http://guides.rubyonrails.org/command_line.html
