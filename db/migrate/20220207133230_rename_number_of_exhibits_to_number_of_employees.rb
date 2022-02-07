class RenameNumberOfExhibitsToNumberOfEmployees < ActiveRecord::Migration[5.2]
  def change
    rename_column :zoos, :number_of_exhibits, :number_of_employees
  end
end
