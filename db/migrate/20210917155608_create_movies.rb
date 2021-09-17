class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.float :rate
      t.text :review
      t.text :spoiler
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
