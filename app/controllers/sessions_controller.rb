class SessionsController < ApplicationController

  def new
  end

  def create
    @matchmaker = Matchmaker.find_by(username: params[:session][:username])

    if Matchmaker.find_by(username: params[:session][:username]).nil?
     flash[:notice] = "#{params[:session][:username]} is not a registered Matchmaker, please try again"
     redirect_to login_path

   elsif @matchmaker && !@matchmaker.authenticate(params[:session][:password])
      flash[:password_error] = "incorrect password, please try again"
      redirect_to login_path

    elsif @matchmaker && @matchmaker.authenticate(params[:session][:password])
      session[:matchmaker_id] = @matchmaker.id
      redirect_to matchmaker_path(@matchmaker)
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
