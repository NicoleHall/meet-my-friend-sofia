class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_matchmaker #available in all controllers and corresponding views 

  def current_matchmaker
    @current_matchmaker ||= Matchmaker.find(session[:matchmaker_id]) if session[:matchmaker_id]
  end
end
