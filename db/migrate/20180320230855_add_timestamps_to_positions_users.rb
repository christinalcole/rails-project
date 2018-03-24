class AddTimestampsToPositionsUsers < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :positions_users, null: true

    long_ago = DateTime.new(2003, 8, 13)
    PositionsUser.update_all(created_at: long_ago, updated_at: long_ago)

    change_column_null :positions_users, :created_at, false
    change_column_null :positions_users, :updated_at, false
  end
end
