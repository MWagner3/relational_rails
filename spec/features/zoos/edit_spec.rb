require 'rails_helper'

RSpec.describe "Edit Zoo Page" do
  context 'user story 12' do
    it 'should route you back to the show page after you submit your edited zoo, updated record should be shown' do

      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      visit "/zoos/#{zoo_1.id}/edit"
      expect(page).to have_field('Name')
      expect(page).to have_field('Free admission')
      expect(page).to have_field('Number of employees')
      expect(page).to have_button("Update Zoo")
      fill_in('Name', with: 'Updated Zoo')
      fill_in('Number of employees', with: 5000)
      click_button('Update Zoo')
      expect(current_path).to eq("/zoos/#{zoo_1.id}")
      expect(page).to have_content('Updated Zoo')
      expect(page).to have_content(5000)

    end
  end
end
