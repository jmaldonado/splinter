== Welcome to Splinter

Splinter is a practice application by Juan Maldonado that can be used to upload files to a server. A notification goes out to a recipient letting them know
they have 3 days to pick up a file and provides a link for them to do so.

== Getting Started

The application cleans out old files every three days. To do that, you'll need to set a cron job. Just navigate to your app's directory and run this
command:

RUN THIS COMMAND =============================================
bundle exec whenever --update-crontab splinter

After that, just deploy the app like any other application. You will need to introduce some of your own mojo, however. The email portion uses Gmail, the
file storage uses Amazon s3 and the database of choice is PostgreSQL. For Amazon s3, it might be a good idea to make the files in the bucket of choice
delete themselves after 4 or 5 days to be certain, but the remove_old_records method kicked off by the cron job should hoover up those files as they get
deleted, anyway. It's up to you!

Finally, you will need to create the following files and add the following data:

== Update with your PostgreSQL username/password
config/database.yml ==========================================

development:
  adapter: postgresql
  encoding: unicode
  database: splinter_development
  pool: 5
  username: <username>
  password: <password>

test:
  adapter: postgresql
  encoding: unicode
  database: splinter_test
  pool: 5
  username: <username>
  password: <password>

production:
  adapter: postgresql
  encoding: unicode
  database: splinter_production
  pool: 5
  username: <username>
  password: <password>

== Update with a Gmail username/password
config/email.yml ==============================================

development:
  :address: smtp.gmail.com
  :port: 587
  :authentication: plain
  :user_name: "<username>"
  :password: "<password>"
  :enable_starttls_auto: true

test:
  :address: smtp.gmail.com
  :port: 587
  :authentication: plain
  :user_name: "<username>"
  :password: "<password>"
  :enable_starttls_auto: true

production:
  :address: smtp.gmail.com
  :port: 587
  :authentication: plain
  :user_name: "<username>"
  :password: "<password>"
  :enable_starttls_auto: true

== Update with your s3 
config/s3.yml =================================================
access_key_id: '<youraccesskeyid>'
secret_access_key: '<yoursecretaccesskey>'
bucket: '<yourbucket>'



