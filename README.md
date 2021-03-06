# Flavor of The Week
Rails application that uses Spotify API to allow users to share their current favorite song that week.
Users can hover over individual posts/songs to hear a preview of it, repost it to their own page or search for their current favorite song.
Songs can be accessed by an easy to remember slug for easy sharing across platforms or to friends.


##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 2.6.1
- Rails Rails 6.0.3.4

##### 1. Check out the repository

```bash
git clone git@github.com:Libaration/flavoroftheweek.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
