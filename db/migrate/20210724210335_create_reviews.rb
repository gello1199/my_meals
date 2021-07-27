class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :title
      t.text :comment
      t.integer :rating
      t.integer :meal_id
      t.timestamps
    end
  end
end
