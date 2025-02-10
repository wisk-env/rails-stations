class RemoveTheaterFromScreen < ActiveRecord::Migration[7.1]
  def change
    remove_reference :screens, :theater, index: true
  end
end
