class AddStarToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :rate, :float
  end
end
