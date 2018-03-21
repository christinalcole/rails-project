class RemoveNotNullConstraintOnPositionsUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :positions_users, :skill_level, true
  end
end
