class CreateZoos < ActiveRecord::Migration[5.2]
  def change
    create_table :zoos do |t|
      t.string :name
      t.boolean :free_admission
      t.integer :number_of_exhibits

      t.timestamps
    end
  end
end
