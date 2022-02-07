class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name
      t.boolean :has_evs
      t.integer :number_of_models

      t.timestamp
    end
  end
end
