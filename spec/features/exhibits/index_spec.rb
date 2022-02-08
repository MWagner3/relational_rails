require 'rails_helper'

RSpec.describe "exhibit index" do

  context 'user story 3' do

    it 'can list all exhibits with details' do
      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      ex_1 = zoo_1.exhibits.create!(name: "America",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 100)
      ex_2 = zoo_1.exhibits.create!(name: "Africa",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 200)
      zoo_2 = Zoo.create!(name:"another zoo", free_admission: false, number_of_employees: 20)
      ex_3 = zoo_2.exhibits.create!(name: "Asia",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 300)
      ex_4 = zoo_2.exhibits.create!(name: "Arctic",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 400)
      visit "/exhibits"
      expect(page).to have_content(ex_1.name)
      expect(page).to have_content("Houses Deadly Creatures: #{ex_1.houses_deadly_creatures}")
      expect(page).to have_content("Number of Occupants: #{ex_1.number_of_occupants}")
      expect(page).to have_content(ex_2.name)
      expect(page).to have_content("Houses Deadly Creatures: #{ex_2.houses_deadly_creatures}")
      expect(page).to have_content("Number of Occupants: #{ex_2.number_of_occupants}")
    end
  end
end
