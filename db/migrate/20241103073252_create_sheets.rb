class CreateSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :sheets do |t|
      t.integer :column, null: false
      t.string :row, null: false

      t.timestamps
    end
  end
end
