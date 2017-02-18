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
  1. Install Ruby on Rails
    - https://github.com/aria-grande/ggida/wiki/About-Ruby-on-Rails
  2. Install mysql and set up the database
    - https://www.mysql.com/downloads/
  3. Clone the project
  4. Go to home directory
  5. Install gems by running command `bundle install`
  6. Launch a web server by running command `rails server`
    - reference [Rails CLI](http://guides.rubyonrails.org/command_line.html)
  7. Get a greeting from [http://localhost:3000](http://localhost:3000)
  
  
## Database
### creation
  - `rake db:create`

### initialization
  - `rake db:seed`
  - (or created alongside the database with `rake db:setup`)
  
### migration
  - `rake db:migrate`

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
