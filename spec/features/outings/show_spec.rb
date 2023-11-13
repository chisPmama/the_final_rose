require "rails_helper"

RSpec.describe "Outing Show Page" do
  before(:each) do
    test_data
    visit outing_path(@helicopter)
  end

  describe 'USER STORY 4/7' do
    it 'when visiting the outing show page lists the name, location, and date' do
      expect(page).to have_content(@helicopter.name)
      expect(page).to have_content(@helicopter.location)
      expect(page).to have_content(@helicopter.print_date)
    end

    it "includes the number of contestants in the outing and their names" do
      expected_results = @helicopter.contestants.uniq
      expect(page).to have_content("Count of Contestants: #{expected_results.length}")
      expected_results.each do |c|
        expect(page).to have_content(c.name)
      end
    end
  end



end