# Required Keys
# If a particular configuration value is required but not set, it's appropriate to raise an error.
#
# To require configuration keys:
#
# # config/initializers/dotenv.rb
#
# Dotenv.require_keys("SERVICE_APP_ID", "SERVICE_KEY", "SERVICE_SECRET")
# If any of the configuration keys above are not set, your application will raise an error during initialization. This method is preferred because it prevents runtime errors in a production application due to improper configuration.
