require 'rails_helper'

RSpec.describe "zoo show page" do

  context 'user story 2' do

    it "can visit an id page where the zoo will be listed with its details" do

      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      zoo_2 = Zoo.create!(name:"another zoo", free_admission: false, number_of_employees: 20)

      visit "/zoos/#{zoo_1.id}"
      expect(page).to have_content(zoo_1.name)
      expect(page).to have_content("Free Admission: #{zoo_1.free_admission}")
      expect(page).to have_content("Number of Employees: #{zoo_1.number_of_employees}")
      expect(page).to_not have_content(zoo_2.name)

      visit "/zoos/#{zoo_2.id}"
      expect(page).to have_content(zoo_2.name)
      expect(page).to have_content("Free Admission: #{zoo_2.free_admission}")
      expect(page).to have_content("Number of Employees: #{zoo_2.number_of_employees}")
      expect(page).to_not have_content(zoo_1.name)
    end
  end


  context 'user story 6' do

    it 'shows total count of exhibits a zoo has' do
      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      ex_1 = zoo_1.exhibits.create!(name: "America",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 100)
      ex_2 = zoo_1.exhibits.create!(name: "Africa",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 200)
    visit "/zoos/#{zoo_1.id}"
    expect(page).to have_content("Exhibits Listed: #{zoo_1.exhibit_count}")


    end
  end

  context 'user story 12' do

    it 'should have a link to update zoo' do

      zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
      visit "/zoos/#{zoo_1.id}"
      expect(page).to have_link("Update Zoo")
      click_link("Update Zoo")
      expect(page).to have_current_path("/zoos/#{zoo_1.id}/edit")

    end
  end
end
