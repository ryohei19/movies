class Moviegenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :movie_genres
  end
end
