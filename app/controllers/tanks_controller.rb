class TanksController < ApplicationController

  get '/tanks' do
    @tanks = current_user.tanks
    erb :'/tanks/index'
  end



  get '/tanks/new' do
    erb :'/tanks/new'
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
