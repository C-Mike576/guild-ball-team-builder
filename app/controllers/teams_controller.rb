class TeamsController < ApplicationController

    get '/teams' do
        if_not_logged_in_redirect
        @teams = current_user.teams
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
        if picked_squad.values.uniq.length == picked_squad.values.length
           current_user.teams.create(params)
        end
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

    patch '/teams/:id' do
        if_not_logged_in_redirect
        @team = Team.find_by(:id => params[:id])
        correct_user?(@team)
        if picked_squad.values.uniq.length == picked_squad.values.length
            @team.update(params.select{|p| p == "captian_id" || p == "name" ||
            p == "mascot_id" || p == "squaddie_1_id" || p == "squaddie_2_id" ||
             p == "squaddie_3_id" || p == "squaddie_4_id"})
        end
        redirect '/teams'
    end

    get '/teams/:id' do
        if_not_logged_in_redirect
        @picked_team = Team.find(params[:id])
        correct_user?(@picked_team)
        erb :"teams/show"
    end

    get '/teams/:id/delete' do
        if_not_logged_in_redirect
        @delete_team = Team.find(params[:id])
        correct_user?(@delete_team)
        erb :"teams/delete"
    end
    
    delete '/teams/:id/delete' do
        if_not_logged_in_redirect
        @delete_team = Team.find(params[:id])
        correct_user?(@delete_team)
        if params[:choose] == "yes" 
            @delete_team.delete
        end
        redirect '/teams'
    end

private

    def picked_squad
        params.select{|p| p == "squaddie_1_id" || p == "squaddie_2_id" ||
            p == "squaddie_3_id" || p == "squaddie_4_id"}
    end

end