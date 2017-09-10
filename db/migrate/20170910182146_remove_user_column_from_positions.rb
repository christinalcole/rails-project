class RemoveUserColumnFromPositions < ActiveRecord::Migration[5.0]
  def change
    remove_column :positions, :user_id, :integer
  end
end
