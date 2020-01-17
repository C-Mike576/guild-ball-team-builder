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
        correct_user?(@team)
        @captians = Player.where(:position => "Captian")
        @mascots = Player.where(:position => "Mascot")
        @squaddies = Player.where(:position => "Squaddie")
        erb :"teams/edit"
    end

    post '/teams/:id' do
        if_not_logged_in_redirect
        @team = Team.find_by(:id => params[:id])
        @team.update(params.select{|p| p == :captian_id || p == :name ||
        p == :mascot_id || p == :squaddie_1_id || p == :squaddie_2_id||
         p == :squaddie_3_id || p == :squaddie_4_id})
        redirect '/teams'
    end

    get '/teams/:id' do
        if_not_logged_in_redirect
        @picked_team = Team.find(params[:id])
        correct_user?(@picked_team)
        @captian = Player.find_by(:id => @picked_team.captian_id)
        @mascot = Player.find_by(:id => @picked_team.mascot_id)
        @squaddie_1 = Player.find_by(:id => @picked_team.squaddie_1_id)
        @squaddie_2 = Player.find_by(:id => @picked_team.squaddie_2_id)
        @squaddie_3 = Player.find_by(:id => @picked_team.squaddie_3_id)
        @squaddie_4 = Player.find_by(:id => @picked_team.squaddie_4_id)
        erb :"teams/show"
    end



end