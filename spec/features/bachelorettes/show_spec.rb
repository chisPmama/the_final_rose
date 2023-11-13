require "rails_helper"

RSpec.describe "the bachelorette show page" do
  before(:each) do
    test_data
    visit bachelorette_path(@hannah)
  end

  describe 'USER STORY 1/7' do
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

  describe 'USER STORY 6/7' do
    it 'when visiting the show page, shows the average age of all of the contestants' do
      expected_result = @hannah.contestants.uniq.map{|c| c.age}.sum.div(@hannah.contestants.count)
      expect(page).to have_content("Average Age of Contestants: #{expected_result}")
    end

  end

end