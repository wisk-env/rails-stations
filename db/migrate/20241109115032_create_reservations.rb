class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.integer :schedule_id, null: false
      t.integer :sheet_id, null: false
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps
      t.index [:date, :schedule_id, :sheet_id], unique: true
    end
  end
end
