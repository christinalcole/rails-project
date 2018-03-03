class AddSkillLevelToPositionsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :positions_users, :skill_level, :integer

    PositionsUser.reset_column_information

    PositionsUser.all.each do |pu|
      pu.skill_level = 3
      pu.save
    end

    change_column :positions_users, :skill_level, :integer, null: false
  end
end
