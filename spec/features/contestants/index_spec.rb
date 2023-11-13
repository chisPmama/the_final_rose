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

end