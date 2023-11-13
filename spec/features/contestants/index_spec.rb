require "rails_helper"

RSpec.describe "Bachelorette Contestant Index Page" do
  before(:each) do
    test_data
    @contestants = @hannah.contestants
    visit bachelorette_contestants_path(@hannah)
  end

  describe 'USER STORY 2/7' do
    it 'when visiting the bachelorette contestant index, contestant age and hometown is listed' do
      @contestants.each do |c|
        expect(page).to have_content(c.name)
        expect(page).to have_content(c.hometown)
      end
    end
  end

  describe 'USER STORY 7/7' do
    it 'when visiting the contestsants index, there is a separate unique list of where all the contestants are from' do
      test = @hannah.contestants.create!(name: "Boy Toy", age: 24, hometown: "Louisville")
      test2 = @hannah.contestants.create!(name: "Lover Boy", age: 27, hometown: "Louisville")
      visit bachelorette_contestants_path(@hannah)

      expected_locations = @contestants.map{|c| c.hometown}.uniq
      expected_locations.each do |l|
        expect(page).to have_content(l)
      end
    end
  end
end