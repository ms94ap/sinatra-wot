class TanksController < ApplicationController

  get '/tanks'
  erb :index


  get '/tanks/new' do
    erb :'/tanks/new'
  end

  post '/tanks' do
    @tank = Tank.create(name: params["tank"]["name"], nation: params["tank"]["nation"])
    @tank.user_id = current_user.id
    if @tank.save
      redirect to "/tanks/#{@tank.id}"
    else
      flash[:message] = "Please enter all fields"
      erb :'/tanks/new'
    end
  end

  get '/tanks/:id' do
    @tank = Tank.find(params[:id])
    erb :"/tanks/show"
  end

  get '/tanks/:id/edit' do
    @tank = Tank.find(params['id'])
    erb :'/tanks/edit'
  end

  patch '/tanks/:id' do
    @tank = Tank.find(params['id'])
    @tank.name = params['name']
    @tank.nation = params['nation']
    @tank.save
    redirect to "/tanks/#{@tank.id}"
  end

  delete '/tanks/:id/' do
    @tank = Tank.find(params['id'])
    @tank.delete
  end
end



# add user_id from current_user to the form / Tank.create in controller
# if the tank saves, render tanks/show.erb for the new tank with flash saying "tank created"
# if the tank doesn't save, render the form again with a flash message saying "couldnt create tank"
# make a form / controller method / button to edit tank
