class TeamsController < ApplicationController

    get '/teams' do
        if_not_logged_in_redirect
        @teams = Team.where(:user_id => session[:id])
        erb :"teams/index"
    end

    get '/build-new-team' do
        if_not_logged_in_redirect
        
        @captians = Player.where(:position => "Captian")
        @mascots = Player.where(:position => "Mascot")
        @squaddies = Player.where(:position => "Squaddie")
        erb :"teams/new"
    end

    post '/build-new-team' do
        if_not_logged_in_redirect
        Team.create(params)
        redirect '/teams'
    end


end