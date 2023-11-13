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

  describe 'USER STORY 5/7' do
    before :each do
      expect(page).to have_link("Remove", count: 3)
      within("#contestant-#{@brian.id}") do
        click_link "Remove"
      end
    end

    it "has a link after each contestant's name to remove" do
      expect(current_path).to eq(outing_path(@helicopter))
      expect(page).to_not have_content(@brian.name)
    end
    
    it "when visiting another outing that this contestant was in, still has that contestant" do
      visit outing_path(@hotsprings)
      expect(page).to have_content(@brian.name)
    end
  end



end