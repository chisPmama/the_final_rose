class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = Contestant.where(bachelorette_id: params[:bachelorette_id])
  end

end