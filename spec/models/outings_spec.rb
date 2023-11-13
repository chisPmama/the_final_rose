require "rails_helper"

RSpec.describe Outing, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe '#print_date' do
    it 'can return the date in a specific format' do
      expect(@hotsprings.print_date).to eq("10/08/19")
    end
  end

  describe '#count_contestants' do
    it 'will return number of contestants in outing' do
      expect(@helicopter.count_contestants).to eq(3)
    end
  end

  describe '#contestants_list' do
    it 'will return the names of the contestants in a joined string' do
      expect(@helicopter.contestants_list).to eq("Brian Bowles, Chasen Coscia, Hunter Jones")
    end
  end
end
