class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings
  
  def print_date
    date.strftime("%m/%d/%y")
  end

  def count_contestants
    contestants.count
  end

  def contestants_list
    contestants.pluck(:name).join(", ")
  end
end
