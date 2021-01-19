class WorkoutsController < ApplicationController



#CREATE

    #New(Will Render a form to display the form)
    #GET request to '/workouts/new'
    get '/workouts/new' do 
        if logged_in?
        erb :'/workouts/new'
    else
        redirect '/login'
    end
    end

    #Create(When the User hits SUBMIT in the form, this is going to catch the request)
    # POST request to '/workouts

post '/workouts' do 
    workout = current_user.workouts.build(params)
    if !workout.body_part.empty? && !workout.desc.empty? && !workout.desc.empty?
        workout.save
        redirect '/workouts'

    else
        @error = "Data Invalid, Please complete all box's"
        erb :'/workouts/new'
    end
end



#READ

    #Index(shows all workouts)
    # GET request to '/workouts'
    get '/workouts' do
        
        if logged_in?
            @workouts = Workout.all.reverse
            erb :'workouts/index'
             
        else
            redirect '/login'
        end

    end

    
    #My_Workouts 
    
    get '/users/my_workouts' do
        
        
        erb :'users/my_workouts'
        
        
end 


    #Show(One particular workout)
    # GET request to '/workouts/:id'

    get '/workouts/:id' do 
        if logged_in?
        @workout = Workout.find_by(id: params[:id])
          if @workout
            erb :'workouts/show'
          else 
            redirect '/workouts'
          end

       else
        redirect '/login'
       end

    end 


#UPDATE

    #Edit(to display the form)
    #GET request to '/workouts/:id/edit'
    get '/workouts/:id/edit' do
        if logged_in?
        @workout = Workout.find(params[:id])
        erb :'/workouts/edit'
        else
         redirect '/login'
        end

    end


    #Update(Updates the existing data based on the id)
    #POST/PATCH request to '/workouts/:id'
    patch '/workouts/:id' do 
        @workout = Workout.find(params[:id])
        if !params["workout"]["body_part"].empty? && !params["workout"]["time"].empty? && !params["workout"]["desc"].empty?
            @workout.update(params["workout"])
            redirect "/workouts/#{params[:id]}"
    
        else
            @error = "Data Invalid, Please complete all box's"
            erb :'/workouts/edit'
        end
        
    end 




#DESTROY
    #Delete
    #POST/PATCH request to '/workouts/:id'
    delete '/workouts/:id' do
        workout = Workout.find(params[:id])
        workout.destroy
        redirect '/workouts'
    end


end