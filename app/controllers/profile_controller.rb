require './config/environment'

#handles all user routes
class ProfileController < ApplicationController



  #registers a new user & returns back to our homepage to sign in
  post '/register' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect '/failure'
    else
      @user = User.create(username: params[:username], password: params[:password], email: params[:email])
      session[:user_id] = @user.id
      redirect '/profile'
    end
  end

  #gets user homepage
  get '/profile' do
    if logged_in?
      @user = User.find_by(params[:username])
      @recipes = Recipe.all.order(created_at: :desc)
      erb :'/users/home'
    else
      redirect '/failure'
    end
  end

  #authicates and logs user into our user homepage
  post '/profile' do
    user = User.find_by(username: params[:username])

    if params[:username] == "" || params[:password] == ""
      redirect 'failure'
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/failure'
    end
  end

  get '/failure' do #gets our 404 page
    erb :failure
  end

  get '/logout' do #logs user out of session
    if logged_in?
      session.destroy
      redirect "/"
    else
      redirect to '/'
    end
  end
end
