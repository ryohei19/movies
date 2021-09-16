class AddNameToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :name, :string
  end
end
