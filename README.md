Learn-Rails
Problems when use Ruby on Rails in Windows

* Before Push to Heroku:
- Need to run below command first in order to compile the stylesheet.
$ bundle exec rake assets:precompile

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
* modeling users:
$ rails generate controller Users new
$ rails generate model User name:string email:string
$ bundle exec rake db:migrate (Create a sqlite database db/development.sqlite3)
$ bundle exec rake db:rollback (delete database)
- A validity test
$ bundle exec rake test:models  <- Cant Run this command in window)
$ rake test:models  <- must run this

