class TeamsController < ApplicationController

    get '/teams' do
        if_not_logged_in_redirect
        @teams = Team.find_by(:user_id => session[:user_id])
        erb :"teams/index"
    end

    get '/build-new-team' do
        if_not_logged_in_redirect
        @captians = Player.where(:position => "Captian")
        @mascots = Player.where(:position => "Mascot")
        @squaddies = Player.where(:position => "Squaddie")
        erb :"teams/new"
    end

end