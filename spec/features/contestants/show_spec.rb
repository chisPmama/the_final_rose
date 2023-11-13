require "rails_helper"

RSpec.describe "Bachelorette Contestant Show Page" do
  before(:each) do
    test_data
    @contestants = @hannah.contestants
    visit bachelorette_contestant_path(@hannah, @hunter)
  end

  describe 'USER STORY 3/7' do
    it 'when visiting the contestant show page, it displays the contestant name, season number, and season description' do
      expect(page).to have_content(@hunter.name)
      expect(page).to have_content(@hannah.season_number)
      expect(page).to have_content(@hannah.description)
    end

    it "has all of the contestant's outings listed" do
      expected_outings = @hunter.outings
      expected_outings.each do |o|
        expect(page).to have_content(o.name)
      end
    end

    it "each outing has a link and when I click the outing it goes to the outing show page" do
      expected_outings = @hunter.outings
      expected_outings.each do |o|
        expect(page).to have_link("#{o.name}", href: outing_path(o))
      end
      click_on("Kickball")
      expect(current_path).to eq(outing_path(@kickball))
    end
  end

end