class AddReferencesToScreens2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :screens, :theater, null: false, foreign_key: true
    add_column :screens, :number, :integer
    add_index :screens, [:number, :theater_id], unique: true
  end
end
