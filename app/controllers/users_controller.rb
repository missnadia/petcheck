class UsersController < ApplicationController

  get '/signup' do
    !logged_in? ? (erb :"/users/create_user") : (redirect to "/pets")
  end

  post '/signup' do
    if !logged_in?
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
        redirect to "/signup"
      else
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to "/pets"
      end
    else
      redirect to "/signup"
    end
  end

  get '/login' do
    (!logged_in?) ? (erb :"/users/login") : (redirect to "/pets")
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/pets"
    else
      flash[:notice] = "Invalid username/password. Please try again." if params[:email] || params[:password]
      redirect to "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
  end
end
