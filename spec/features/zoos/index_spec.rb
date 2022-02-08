require 'rails_helper'

RSpec.describe "zoo index" do

  describe 'user story 1' do

    it 'can list all zoos with details' do
      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"another zoo", free_admission: false, number_of_employees: 20)
      zoo_3 = Zoo.create!(name:"last zoo", free_admission: true, number_of_employees: 200)
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
end
