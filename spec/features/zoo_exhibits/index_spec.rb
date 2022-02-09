require 'rails_helper'

RSpec.describe "zoo exhibits index" do

  context 'user story 5' do

    it 'shows each exhibit with details of a select zoo' do
      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      ex_1 = zoo_1.exhibits.create!(name: "America",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 100)
      ex_2 = zoo_1.exhibits.create!(name: "Africa",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 200)
      zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
      ex_3 = zoo_2.exhibits.create!(name: "Asia",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 300)
      ex_4 = zoo_2.exhibits.create!(name: "Arctic",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 400)
      visit "/zoos/#{zoo_1.id}/exhibits"
      expect(page).to have_content(ex_1.name)
      expect(page).to have_content("Houses Deadly Creatures: #{ex_1.houses_deadly_creatures}")
      expect(page).to have_content("Number of Occupants: #{ex_1.number_of_occupants}")
      expect(page).to not_have_content(ex_2.name)
      expect(page).to not_have_content("Houses Deadly Creatures: #{ex_2.houses_deadly_creatures}")
      expect(page).to not_have_content("Number of Occupants: #{ex_2.number_of_occupants}")
    end
  end
end
