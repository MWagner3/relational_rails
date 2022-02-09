require 'rails_helper'

RSpec.describe "zoo index" do

  context 'user story 1' do

    it 'can list all zoos with details' do
      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
      zoo_3 = Zoo.create!(name:"Third Zoo", free_admission: true, number_of_employees: 200)
      visit "/zoos"
      expect(page).to have_content(zoo_1.name)
      expect(page).to have_content("Free Admission: #{zoo_1.free_admission}")
      expect(page).to have_content("Number of Employees: #{zoo_1.number_of_employees}")
      expect(page).to have_content(zoo_2.name)
      expect(page).to have_content("Free Admission: #{zoo_2.free_admission}")
      expect(page).to have_content("Number of Employees: #{zoo_2.number_of_employees}")
      expect(page).to have_content(zoo_3.name)
      expect(page).to have_content("Free Admission: #{zoo_3.free_admission}")
      expect(page).to have_content("Number of Employees: #{zoo_3.number_of_employees}")
    end
  end

  context 'user story 6' do

    it 'sorts index by most recently created' do
      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
      zoo_3 = Zoo.create!(name:"Third Zoo", free_admission: true, number_of_employees: 200)
      visit "/zoos"
      expect(zoo_3.name).to appear_before(zoo_2.name)
      expect(zoo_2.name).to appear_before(zoo_1.name)
    end
  end

  context 'user story 11' do

    it 'should have a link to create a new zoo' do
      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
      zoo_3 = Zoo.create!(name:"Third Zoo", free_admission: true, number_of_employees: 200)
      visit "/zoos"
      expect(page).to have_link("New Zoo")
      click_link("New Zoo")
      expect(page).to have_current_path('/zoos/new')
      expect(page).to have_field('zoo_name')
      expect(page).to have_field('zoo_free_admission')
      expect(page).to have_field('zoo_number_of_employees')
      expect(page).to have_button("Create Zoo")
    end

    it 'should route you back to the index page after you hit submit, new record should show' do

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
    end
  end
end
