ENV['SINATRA_ENV'] ||= "development"
#ENV['SESSION_SECRET'] = ""


require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require 'sysrandom/securerandom'
require './app/controllers/application_controller'
require './app/controllers/profile_controller'
require './app/controllers/recipe_controller'
require_all 'app'
