<h1 align="center">The Good Good</h1>
<h3 align="center">The Good Good is a curated a Twitter API of popular Twitter accounts, trending hashtags and viral conversations taking place on Twitter</h3>

  
## Clone the source locally

##### $ `git clone https://github.com/thegoodgood/ggbackend.git`

##### $ `cd ggbackend`

## Available Scripts

In the project directory, you can run:

##### `bundle install`

Installs project dependencies

##### `rails s`
Open [http://localhost:3000](http://localhost:3000) to view the API in the browser.

## API Endpoints

#### Users
- CRUD
- login / signup
- profile

#### Tweets
- tweets
- upvote / downvote
- get_timeline
- get_socialcommentary
- get_hashtag_search

#### Hashtags
- CRUD

#### Twitter Search
- get_timeline
- get_socialcommentary
- get_hashtag_search

## Features

- [x] User authentication
- [x] Upvote / downvote tweets
- [x] Get timeline from Twitter
- [x] Get tweets from Twitter list
- [x] Twitter search based hashtag
- [ ] Get relevant news

## Dependencies
- ruby '2.6.1'
- gem 'oauth'
- gem 'httparty'
- gem 'rest-client'
- gem 'twurl'
- gem 'rails'
- gem 'pg'
- gem 'jwt'
- gem 'active_model_serializers'
- gem 'rack-cors'

## License
MIT ©jasterix
