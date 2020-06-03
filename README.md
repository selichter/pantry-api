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


Stand up app on port :3000:
`docker-compose up --build`

Stand up db:
`docker-compose run web rake db:create`

Run Tests:
`cucumber .` from the features directory
`cucumber . health.feature -r step_definitions/health_steps.rb`

Stand up Dev Environment:
```
docker-compose up
docker-compose run -e "RAILS_ENV=development" web rake db:create db:migrate
```



Run Rspec Tests:
```
docker-compose up
docker-compose run -e "RAILS_ENV=test" web rake db:create db:migrate
docker-compose run -e "RAILS_ENV=test" web rspec spec
```


Migration:
```
docker-compose run web rake db:migrate RAILS_ENV=test
```


Deploy to heroku: 
```
 git push heroku master
 heroku ps
 heroku open
```

https://help.heroku.com/63D7ALXT/why-am-i-seeing-user-does-not-have-connect-privilege-error-with-heroku-postgres-on-review-apps
`heroku rake db:schema:load`