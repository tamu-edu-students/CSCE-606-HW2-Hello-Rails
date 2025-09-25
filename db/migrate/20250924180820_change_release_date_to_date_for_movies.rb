class ChangeReleaseDateToDateForMovies < ActiveRecord::Migration[7.1]
  def up
    change_column :movies, :release_date, :date
  end

  def down
    change_column :movies, :release_date, :datetime
  end
end
