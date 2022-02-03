class CreateExhibits < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.boolean :houses_deadly_creatures
      t.integer :number_of_occupants
      t.references :zoo, foreign_key: true

      t.timestamps
    end
  end
end
