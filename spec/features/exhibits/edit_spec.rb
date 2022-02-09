require 'rails_helper'

RSpec.describe "Edit Exhibit Page" do
  context 'user story 14' do
    it 'should route you back to the show page after you submit your edited exhibit, updated record should be shown' do

      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      ex_1 = zoo_1.exhibits.create!(name: "America",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 100)
      ex_2 = zoo_1.exhibits.create!(name: "Africa",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 200)
      visit "/exhibits/#{ex_1.id}/edit"
      expect(page).to have_field('Name')
      expect(page).to have_field('Houses deadly creatures')
      expect(page).to have_field('Number of occupants')
      expect(page).to have_button("Update Exhibit")
      fill_in('Name', with: 'Updated Exhibit')
      fill_in('Number of occupants', with: 5000)
      click_button('Update Exhibit')
      expect(current_path).to eq("/exhibits/#{ex_1.id}")
      expect(page).to have_content('Updated Exhibit')
      expect(page).to have_content(5000)

    end
  end
end
