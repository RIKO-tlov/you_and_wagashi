class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :shop_id
      t.string :product_name,     null: false
      t.string :product_image_id
      t.text :comment,            null: false
      t.float :rate,              null: false

      t.timestamps
    end
  end
end
