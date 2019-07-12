# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(name: "Charlie")
# User.create(name: "Jeff")
# User.create(name: "Ali")
# User.create(name: "Quinn")
# User.create(name: "Masha")
# User.first.followers << [User.second, User.third, User.fourth, User.fifth,]




standard_search = "https://api.twitter.com/1.1/search/tweets.json"
binding.pry
# list_search = "https://twitter.com/#{screen_name}/lists/{slug}"

# embed_url = "https://publish.twitter.com/oembed?
  # url=https://twitter.com/Interior/status/463440424141459456"

  a = ApiTwitter.new
  a.home_line

a.users
