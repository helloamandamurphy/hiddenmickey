class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.integer :number
      t.string :image
      t.integer :status
      t.text :subject
      t.integer :user_id
      t.integer :series_id

      t.timestamps
    end
  end
end
