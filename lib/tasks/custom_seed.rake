# namespace :db do
#   namespace :seed do
#
#     Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
#       seed = File.basename(filename, '.rb').intern
#       task seed => :environment do
#         load(tweets_seed.rb) if File.exist?(tweets_seed.rb)
#         load(users_seed.rb) if File.exist?(users_seed.rb)
#       end
#     end
#
#     task :all => :environment do
#       Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
#         load(tweets_seed.rb)
#         load(users_seed.rb)
#       end
#     end
#   end
# end
#
#  # To run specific seed file:
# # rake db:seed:seed_file_name
#
# # To run all the seeds file with order in that db/seeds folder:
# # rake db:seed:all
