class TanksController < ApplicationController

  get '/tanks' do
    if logged_in?
      @user = current_user
      erb :'users/tanks'
    else
      redirect to "/login"
    end
  end



  get '/tanks/new' do
    if logged_in?
      @user = current_user
      erb :'/tanks/new'
    else
      redirect to "/login"
    end
  end

  post '/tanks' do
    if params["name"] == "" && params["nation"] == ""
      flash[:message] = "Please fill in all fields"
      erb :'tanks/new'
    else
      @tank = Tank.create(name: params["tank"]["name"], nation: params["tank"]["nation"])
      @tank.user_id = current_user.id
    end
    if @tank.save
      redirect to "/tanks/#{@tank.id}"
    else
      flash[:message] = "Please enter all fields"
      erb :'/tanks/new'
    end
  end

  get '/tanks/:id' do
    @tank = Tank.find(params['id'])
    erb :"/tanks/show"
  end

  get '/tanks/:id/edit' do
    @tank = Tank.find(params['id'])
    erb :'/tanks/edit'
  end

  post '/tanks/:id' do
    @tank = Tank.find(params['id'])
    @tank.name = params['name']
    @tank.nation = params['nation']
    @tank.save
    redirect to "/tanks/#{@tank.id}"
  end

  delete '/tanks/:id' do
    @tank = Tank.find(params['id'])
    @tank.delete
    redirect to '/tanks'
  end
end
