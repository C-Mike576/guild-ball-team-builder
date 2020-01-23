require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_guild_meeting"
  end
  
  helpers do
    def if_not_logged_in_redirect
      if !logged_in?
        redirect '/'
      end
    end
    
    def logged_in?
      !!current_user
    end

    def correct_user?(team)
      if current_user.id != team.user_id
        redirect '/'
      end
    end
  
    
    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    
  end

  get "/" do
    erb :index
  end
end
