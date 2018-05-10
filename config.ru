require './config/environment'

use Rack::MethodOverride

use UsersController
use PetsController
run ApplicationController
