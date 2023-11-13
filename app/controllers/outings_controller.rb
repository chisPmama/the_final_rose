class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def destroy
    outing = Outing.find(params[:id])
    ContestantOuting.find_by(contestant: params[:contestant_id], outing: params[:id]).destroy
    redirect_to outing_path(outing)
  end

end