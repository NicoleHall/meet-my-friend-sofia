class MatchmakersController < ApplicationController
  def new
    @matchmaker = Matchmaker.new
  end

  def create
    @matchmaker = Matchmaker.new(matchmaker_params)
    if @matchmaker.save
      session[:matchmaker_id] = @matchmaker.id
      redirect_to @matchmaker
      #redirect_to matchmaker_path(@matchmaker)
    else
      #rerender the new view if validations don't pass
    end
  end

  def show
    @matchmaker = current_matchmaker
  end

  private
  def matchmaker_params
    params.require(:matchmaker).permit(:username, :password)
  end
end
