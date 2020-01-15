class TeamsController < ApplicationController

    get '/teams' do
        if_not_logged_in_redirect
        @teams = Team.all
        erb :"teams/index"
    end

    get '/build-new-team' do
        if_not_logged_in_redirect
        erb :"teams/new"
    end

end