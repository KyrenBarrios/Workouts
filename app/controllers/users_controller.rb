class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup' 
end

post '/signup' do
    @user = User.new(params)
     if @user.save 
        session[:user_id] = @user.id
        redirect '/workouts'
     else 
        
        @error = @user.errors.full_messages
        erb :'users/signup'
     end 
end 
end
