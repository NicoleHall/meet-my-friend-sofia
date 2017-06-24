class MatchmakersController < ApplicationController
  def new
    @matchmaker = Matchmaker.new
  end

  def create
    @matchmaker = Matchmaker.new(matchmaker_params)
    if @matchmaker.save
      session[:matchmaker_id] = @matchmaker.id
      redirect_to matchmaker_path(@matchmaker)
    else
      #rerender the new view if validations don't pass
    end
  end

  def show
    @matchmaker = current_matchmaker
  end

  def edit
    @matchmaker = Matchmaker.find(params[:id])
  end

  def update
    matchmaker = Matchmaker.find(params[:id])
    if params[:matchmaker][:new_password] == params[:matchmaker][:new_password_confirmation]
      matchmaker.update_attribute(:password, params[:matchmaker][:new_password])
      flash[:success] = "Your password has been updated"
      redirect_to matchmaker_path(matchmaker)
    else
      redirect_to edit_matchmaker_path(matchmaker.id)
      flash[:failed_password_reset] = "New passwords did not match, please re-enter a new password"
    end

  end

  private
  def matchmaker_params
    params.require(:matchmaker).permit(:username, :password)
  end
end
