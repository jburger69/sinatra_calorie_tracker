require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end
Rack::MethodOverride
use UserController
use SessionController
use DayController
use IntakeController
run ApplicationController
