class TeamsController < ApplicationController

    get '/teams' do
        if_not_logged_in_redirect

        @teams = Team.where(user_id: session[:user_id])
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
        @team = Team.new(params)
        @team.user_id = session[:user_id]
        @team.save
        redirect '/teams'
    end

    get '/teams/:id/edit' do
        if_not_logged_in_redirect
        @team = Team.find(params[:id])
        erb:"teams/edit"


end