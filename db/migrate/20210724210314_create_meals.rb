class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
