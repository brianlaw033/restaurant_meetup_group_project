# restaurant_meetup_group_project

##### Application:

Through this application you can match users among each others based on their wish to eat at a same restaurant.
Users can define their preferences for a certain cuisine, a location (district based) and a particular budget.


## Technologies Used

Application: Ruby, Sinatra, psql<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

```
$ git clone https://github.com/brianlaw033/restaurant_meetup_group_project.git
```

Install required gems:
```
$ bundle install
```

Create databases:

1. Type psql on your terminal to connect to the server:

```
psql.
```

2. Create databases and the following tables:

```
rake db:create
rake db:migrate

```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.
