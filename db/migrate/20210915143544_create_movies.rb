class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.float :star
      t.text :review
      t.text :spoiler
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
