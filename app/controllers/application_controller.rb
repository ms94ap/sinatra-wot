require './config/environment'
require "./app/models/user"
require 'rack-flash'


class ApplicationController < Sinatra::Base
use Rack::Flash

  configure do
   set :public_folder, 'public'
   set :views, 'app/views'
   enable :sessions
   set :session_secret, "secret"
 end

 get '/' do
  erb :main
 end
end
