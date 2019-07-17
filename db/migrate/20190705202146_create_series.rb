class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.integer :release_year
      t.string :name
      t.integer :number_in_set
      t.integer :park

      t.timestamps
    end
  end
end
