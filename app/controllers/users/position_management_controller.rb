class Users::PositionManagementController < ApplicationController

  def edit
    positions_users = current_user.positions_users
    Position.find_each do |position|
      unless positions_users.detect {|pu| pu.position_id == position.id}
        current_user.positions_users.build(position_id: position.id)
      end
    end
  end

  def update
    raise params.inspect
    if current_user.update(user_params)
      redirect_to user_positions_path(current_user)
    else
      render 'edit'
    end
  end
end
