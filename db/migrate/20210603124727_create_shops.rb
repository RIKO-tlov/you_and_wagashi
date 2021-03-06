class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string  :shop_image_id
      t.string  :name,             null: false
      t.string  :kana_name,        null: false
      t.string  :postal_code
      t.string  :address
      t.string  :url
      t.string  :holiday
      t.time    :bussiness_start_time
      t.time    :bussiness_end_time
      t.string  :telephone_number
      t.text    :description,        null: false


      t.timestamps
    end
  end
end
