class RemoveStarFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :star, :float
  end
end
