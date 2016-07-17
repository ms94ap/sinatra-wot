class UsersController < ApplicationController

get '/signup' do
  if !logged_in?
    erb :'users/signup'
  else
    redirect to '/welcome'
  end
end

post '/signup' do
  if params[:username] == "" || params[:email] == "" || params[:password] == ""
    redirect to '/signup'
  else
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])
    @user.save
   erb :'/users/welcome'
  end
end

get '/login' do
  if !logged_in?
    erb :'/users/login'
  else
    redirect to '/welcome'
  end
end

 post '/login' do
  @user = User.find_by(username: params["username"])
  if @user && @user.authenticate(params["password"])
    session[:user_id] = @user.id
    redirect to '/users/welcome'
  else
    flash[:message] = "Wrong username and/or password"
    redirect to '/'
  end
end



helpers do
def logged_in?
  !!session[:user_id]
end

def current_user
  User.find(session[:user_id])
end
end


end
