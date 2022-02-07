Exhibit.destroy_all
Zoo.destroy_all

stafford_zoo = Zoo.create!(name: "Stafford Zoo",
                           free_admission: false,
                           number_of_employees: 3)
fairfax_zoo = Zoo.create!(name: "Fairfax Zoo",
                           free_admission: true,
                           number_of_employees: 1000)

stafford_zoo.exhibits.create!(name: "American Trails",
                              houses_deadly_creatures: true,
                              number_of_occupants: 100)
stafford_zoo.exhibits.create!(name: "African Safari",
                              houses_deadly_creatures: true,
                              number_of_occupants: 200)
fairfax_zoo.exhibits.create!(name: "Asian Forest",
                              houses_deadly_creatures: true,
                              number_of_occupants: 300)
fairfax_zoo.exhibits.create!(name: "Arctic Icebergs",
                             houses_deadly_creatures: true,
                             number_of_occupants: 400)
