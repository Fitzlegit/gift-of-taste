require './config/environment'


use Rack::MethodOverride #allows additional route methods; patch, put and delete

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use ProfileController
use RecipeController
run ApplicationController
