# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Maker.destroy_all

lotus = Maker.create!(name: "Lotus Cars",
                             has_evs: true,
                             number_of_models: 2)

honda = Maker.create!(name: "Honda Motor Company",
                            has_evs: false,
                            number_of_models: 2)
