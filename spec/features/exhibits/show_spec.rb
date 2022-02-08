require 'rails_helper'

RSpec.describe "exhibit show page" do

  context 'user story 4' do

    it "can visit an id page where the exhibit will be listed with its details" do

    zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
    ex_1 = zoo_1.exhibits.create!(name: "America",
                                  houses_deadly_creatures: true,
                                  number_of_occupants: 100)
    zoo_2 = Zoo.create!(name:"another zoo", free_admission: false, number_of_employees: 20)
    ex_3 = zoo_2.exhibits.create!(name: "Asia",
                                  houses_deadly_creatures: true,
                                  number_of_occupants: 300)

    visit "/exhibits/#{ex_1.id}"
    expect(page).to have_content(ex_1.name)
    expect(page).to have_content("Houses Deadly Creatures: #{ex_1.houses_deadly_creatures}")
    expect(page).to have_content("Number of Occupants: #{ex_1.number_of_occupants}")
    expect(page).to_not have_content(ex_3.name)

    visit "/exhibits/#{ex_3.id}"
    expect(page).to have_content(ex_3.name)
    expect(page).to have_content("Houses Deadly Creatures: #{ex_3.houses_deadly_creatures}")
    expect(page).to have_content("Number of Occupants: #{ex_3.number_of_occupants}")
    expect(page).to_not have_content(ex_1.name)
  end
end
end
