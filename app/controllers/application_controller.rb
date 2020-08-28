class ApplicationController < ActionController::Base
 def current_user
  return unless session[:id]
  @current_user ||= User.find(session[:id])
 end

 def authorize
    redirect_to '/sessions/new' unless current_user
   end
end
