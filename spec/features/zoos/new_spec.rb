require 'rails_helper'

RSpec.describe "New Zoo page" do
  context 'user story 11' do
    it 'should route you back to the index page after you submit your new zoo, new record should be shown' do

      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
      zoo_3 = Zoo.create!(name:"Third Zoo", free_admission: true, number_of_employees: 200)
      visit "/zoos"
      click_link("New Zoo")
      fill_in('Name', with: 'Fourth Zoo')
      fill_in('Number of employees', with: 2000)
      click_button('Create Zoo')
      expect(current_path).to eq("/zoos")
      expect(page).to have_content("Fourth Zoo")
      expect(page).to have_content("Third Zoo")
      expect(page).to have_content("Second Zoo")
      expect(page).to have_content("First Zoo")
    end
  end
end
