require 'rails_helper'

RSpec.describe Zoo do

Exhibit.destroy_all
Zoo.destroy_all

  describe 'relationships' do
    it {should have_many :exhibits}
  end

  describe "instance methods" do

    it '#exhibit_count' do
      zoo_1 = Zoo.create!(name:"a zoo", free_admission: true, number_of_employees: 2)
      ex_1 = zoo_1.exhibits.create!(name: "America",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 100)
      ex_2 = zoo_1.exhibits.create!(name: "Africa",
                                    houses_deadly_creatures: true,
                                    number_of_occupants: 200)
      expect(zoo_1.exhibit_count).to eq(2)
    end

  end

  describe "class methods" do

    describe "ordered_by_newest" do
      it 'returns zoos ordered by most recent creation' do
        zoo_1 = Zoo.create!(name:"First Zoo", free_admission: true, number_of_employees: 2)
        zoo_2 = Zoo.create!(name:"Second Zoo", free_admission: false, number_of_employees: 20)
        zoo_3 = Zoo.create!(name:"Third Zoo", free_admission: true, number_of_employees: 200)

        expect(Zoo.ordered_by_newest).to eq([zoo_3, zoo_2, zoo_1])
      end
    end
  end
end
