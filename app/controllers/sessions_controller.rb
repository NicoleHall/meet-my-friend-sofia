class SessionsController < ApplicationController

  def new
  end

  def create
    @matchmaker = Matchmaker.find_by(username: params[:session][:username])

    if @matchmaker && @matchmaker.authenticate(params[:session][:password])
      session[:matchmaker_id] = @matchmaker.id
      redirect_to matchmaker_path(@matchmaker)
    else
      #user isn't found or password is incorrect
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end


end
