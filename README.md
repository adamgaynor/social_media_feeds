# README

1. Ensure you're running Redis (port 6379)
2. Ensure you're running Ruby 2.7.1 in a terminal tab, and run `bundle install`
3. In the same tab run `bin/rails server`
4. In another tab run `bundle exec sidekiq`
5. Curl localhost:3000

The idea is to store the responses from the social media feeds in a Redis cache, and to continually query the social media endpoints for any changes.
This allows us to instantaneously respond to user requests with the most recent responses from the social media feeds, while also keeping them up to date.
