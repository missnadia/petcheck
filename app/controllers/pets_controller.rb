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
      if params[:name] == ""
        redirect to "/pets/new"
      else
        @pet = current_user.pets.build(name: params[:name], gender: params[:gender], birthday: params[:birthday], fed: params[:fed], walk: params[:walk], dog_friendly: params[:dog_friendly], vet: params[:vet], add_notes: params[:add_notes])
        @pet.save ? (redirect to "/pets/#{@pet.id}") : (redirect to "/pets/new")
      end
    else
      redirect to '/login'
    end
  end

  get '/pets/:id' do
    if logged_in?
      @pet = Pet.find_by_id(params[:id])
      erb :"/pets/show_pet"
    else
      redirect to "/login"
    end
  end

  get '/pets/:id/edit' do
    if logged_in?
      @pet = Pet.find_by_id(params[:id])
      (@pet.user == current_user) ? (erb :"/pets/edit_pet") : (redirect to "/pets")
    else
      redirect to "/login"
    end
  end

  patch '/pets/:id' do
    if logged_in?
      @pet = Pet.find_by_id(params[:id])
      if params[:name] == ""
        redirect "/pets/#{@pet.id}/edit"
      else
        (@pet.user == current_user) ? (redirect to "/pets/#{@pet.id}" if @pet.update(name: params[:name], gender: params[:gender], birthday: params[:birthday], fed: params[:fed], walk: params[:walk], dog_friendly: params[:dog_friendly], vet: params[:vet], add_notes: params[:add_notes])) : (redirect to '/pets')
      end
    else
      redirect to "/login"
    end
  end

  delete '/pets/:id/delete' do
    if logged_in?
      @pet = Pet.find_by_id(params[:id])
      @pet.delete if @pet.user == current_user
      redirect to "/pets"
    else
      redirect to "/login"
    end
  end
end
