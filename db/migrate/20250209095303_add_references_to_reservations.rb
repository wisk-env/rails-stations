class AddReferencesToReservations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reservations, :movie, index: true
    add_reference :reservations, :movie, null: false, foreign_key: true
    add_reference :reservations, :theater, null: false, foreign_key: true
    add_reference :reservations, :screen, null: false, foreign_key: true
    add_index :reservations, [:theater_id, :screen_id, :sheet_id, :schedule_id, :date], unique: true
  end
end
