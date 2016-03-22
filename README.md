Learn-Rails
Problems when use Ruby on Rails in Windows

* Before Push to Heroku:
- Need to run below command first in order to compile the stylesheet.
$ bundle exec rake assets:precompile

* Bcrypt 3.1.7 not work for window rails

* Need to solve SSL problems:
Error: ssl_connect returned=1 errno=0 state=sslv3 read server certificate b: certificate verify failed
Solutions:
https://gist.github.com/luislavena/f064211759ee0f806c88

* Add a page:
modify routes.rb
add a file in controller folder

* Link inside Orbit content slider do not work:
http://foundation.zurb.com/forum/posts/1639-link-inside-orbit-content-slider-do-not-work

* Image tag in rails
<%= cl_image_tag("my_image.png", :size => "260x180", :crop => :fill) %>

*MailChimp errors:

II. Tips from https://www.railstutorial.org/book/
* DATABASE:
$ rails generate controller Users new
$ rails generate model User name:string email:string
$ bundle exec rake db:migrate (Create a sqlite database db/development.sqlite3)
$ bundle exec rake db:rollback (delete database)
$ rails generate migration add_password_digest_to_users password_digest:string   (Add a column)

- A validity test
$ bundle exec rake test:models  <- Cant Run this command in window)
$ rake test:models  <- must run this
ERROR when run test: http://stackoverflow.com/questions/17150529/why-am-i-asked-to-run-rake-dbmigrate-rails-env-test
- Add ActiveRecord::Migration.maintain_test_schema! to test_helper.rb
- Error Migration Pending:  
Run the command: bundle exec rake db:drop db:create db:migrate db:test:prepare


* database index
$ rails generate migration add_index_to_users_email  -> will add db/migrate/20160204080840_add_index_to_users_email.rb
def change
    add_index :table name, :column, unique: true
  end
* migrate the database
$ bundle exec rake db:migrate
* fixture has problem with unique

PASSWORD:
has_secure_password 
- hashed password_digest (Hashed password) attribute to the database
- password and password_confirmation 
- An authenticate method that returns the user when the password is correct (and false otherwise)
rails enforce password strength:

* Byebug gem
add debugger next to any line of code to track down the bug.

* Simple Form and Zurb Foundation inline forms:
https://victorbueno.wordpress.com/2014/01/24/simple-form-and-zurb-foundation-inline-forms/

* Fixed the problem of Bootstrap brand logo not align well with the right hand link
.navbar-brand > img{
  display: block;
  width: 160px;
}

.navbar-brand {
  padding: 0px;
}