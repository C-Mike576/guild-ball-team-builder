class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        @user = User.create(:username => params[:username], :password => params[:password])
        session[:user_id] = @user.id
        redirect '/teams'
    end

end