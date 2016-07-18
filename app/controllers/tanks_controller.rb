class TanksController < ApplicationController

  get '/tanks/new' do
    erb :'/tanks/new'
  end

  post '/tanks' do
    @tank = Tank.create(name: params["name"], nation: params["nation"])
    @tank.user_id = current_user.id
    if @tank.save
      flash[:message] = "Tank Created"
      erb :'/tanks/show'
    else
      flash[:message] = "Please enter all fields"
      erb :'/tanks/new'
    end
  end

end

# add user_id from current_user to the form / Tank.create in controller
# if the tank saves, render tanks/show.erb for the new tank with flash saying "tank created"
# if the tank doesn't save, render the form again with a flash message saying "couldnt create tank"
# make a form / controller method / button to edit tanks
