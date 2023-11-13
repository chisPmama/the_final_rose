require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it {should have_many :contestants}
  end

  describe '#average_age_contestants' do
    it 'will return the average age of all contestants for that bachelorette' do
      expected_result = @hannah.contestants.uniq.map{|c| c.age}.sum.div(@hannah.contestants.count)
      expect(@hannah.average_age_contestants).to eq(expected_result)
    end
  end
end
