class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def average_age_contestants
    contestants.average(:age).to_f
  end

  def hometowns
    contestants.distinct.pluck(:hometown)
  end

end
