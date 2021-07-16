class AddGenreIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :genre_id, :integer
  end
end
