require './config/environment'
require 'sysrandom/securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password"
  end

  #opens our initial homepage
  get '/' do
    erb :welcome
  end


  helpers do #checks if user is logged in
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
