class PetsController < ApplicationController

  get '/pets' do
    if logged_in?
      @pets = Pet.all
      erb :"/pets/pets"
    else
      redirect to "/login"
    end
  end

  get '/pets/new' do
    logged_in? ? (erb :"/pets/add_pet") : (redirect to "/login")
  end

  post '/pets' do
    if logged_in?
      if params[:content] == ""
        redirect to "/pets/new"
      else
        @pet = current_user.pets.create(content: params[:content])
        redirect to "/pets/#{@pet.id}" if @pet.save
      end
    else
      redirect to '/login'
    end
  end

  get '/pets/:id' do
    if logged_in?
      @pet = pet.find_by_id(params[:id])
      erb :"/pets/show_pet"
    else
      redirect to "/login"
    end
  end

  get '/pets/:id/edit' do
    if logged_in?
      @pet = pet.find_by_id(params[:id])
      (@pet.user == current_user) ? (erb :"/pets/edit_pet") : (redirect to "/pets")
    else
      redirect to "/login"
    end
  end

  patch '/pets/:id' do
    if logged_in?
      if params[:content] == ""
        redirect "/pets/#{params[:id]}/edit"
      else
        @pet = pet.find_by_id(params[:id])
        (@pet.user == current_user) ? (redirect to "/pets/#{@pet.id}" if @pet.update(content: params[:content])) : (redirect to '/pets')
      end
    else
      redirect to "/login"
    end
  end

  delete '/pets/:id/delete' do
    if logged_in?
      @pet = pet.find_by_id(params[:id])
      @pet.delete if @pet.user == current_user
    else
      redirect to "/login"
    end
  end
end
