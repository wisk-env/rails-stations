class CreateScreens < ActiveRecord::Migration[7.1]
  def change
    create_table :screens do |t|
      t.date :date
      t.integer :sheet_id
      t.integer :schedule_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
