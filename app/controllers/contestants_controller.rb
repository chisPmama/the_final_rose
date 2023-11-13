class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = Contestant.where(bachelorette_id: params[:bachelorette_id])
  end

  def show
    @contestant = Contestant.find(params[:id])
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end

end