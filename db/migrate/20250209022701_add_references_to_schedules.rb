class AddReferencesToSchedules < ActiveRecord::Migration[7.1]
  def change
    remove_reference :schedules, :theater, index: true
    add_reference :schedules, :theater, null: false, foreign_key: true
    add_reference :schedules, :screen, null: false, foreign_key: true
    add_index :schedules, [:movie_id, :theater_id, :screen_id], unique: true
  end
end
