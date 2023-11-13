require "rails_helper"

RSpec.describe "the bachelorette show page" do
  before(:each) do
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
    @matthew = @hannah.contestants.create!(name: "Matthew Spraggins", age: 23, hometown: "Newport Beach, California")
    @brian = @hannah.contestants.create!(name: "Brian Bowles", age: 30, hometown: "Louisville, Kentucky")
    @chasen = @hannah.contestants.create!(name: "Chasen Coscia", age: 27, hometown: "Longview, Washington")
    @hunter = @hannah.contestants.create!(name: "Hunter Jones", age: 24, hometown: "Westchester, California")
    @test = Bachelorette.create!(name: "candy", season_number: 15, description: "The Most Dramatic Season Yet!")
    @test.contestants.create!(name: "test", age: 100, hometown: "mars")
    visit "/bachelorettes/#{@hannah.id}"
  end

  describe '#User Story 1/7' do
    it 'when visiting the bachelorette show page displays the bachelorette name, season number, and description' do
      expect(page).to have_content(@hannah.name)
      expect(page).to have_content(@hannah.season_number)
      expect(page).to have_content(@hannah.description)
    end

    it 'includes a link to the bachelorette contestants' do
      expect(page).to have_link("Contestants", href: bachelorette_contestants_path(@hannah))
      click_link("Contestants")
      expected_results = @hannah.contestants
      expected_results.each do |c|
        expect(page).to have_content(c.name)
      end
    end

  end


end