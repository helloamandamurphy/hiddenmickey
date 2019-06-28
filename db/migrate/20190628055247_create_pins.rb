class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.integer :disney_id
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end