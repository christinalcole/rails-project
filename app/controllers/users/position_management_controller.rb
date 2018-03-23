class Users::PositionManagementController < ApplicationController
  # def edit
  #   positions_users = current_user.positions_users
  #   Position.find_each do |position|
  #     unless positions_users.detect {|pu| pu.position_id == position.id}
  #       current_user.positions_users.build(position_id: position.id)#, skill_level: 0)
  #     end
  #   end
  # end

  def edit
    @positions = Position.all
    @positions_users = current_user.positions_users
  end

  def update
    if current_user.update(user_position_params)
      redirect_to user_positions_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def user_position_params
    params.require(:user).permit(:user, positions_users_attributes: [:position_id, :skill_level])
  end
end

{"utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"7ygP/H3za91bM2UrP5TbeyN1EAhbPYCCCnvml14Yur5MuWqMXhxLpdh0Np+SYHDAjV7IdeFJ61+tVZVjJ3QAqA==", "user"=>{"positions_users_attributes"=>{"0"=>{"position_id"=>"1", "skill_level"=>"4"}, "1"=>{"skill_level"=>""}}}, "commit"=>"Update User", "controller"=>"users", "action"=>"update", "id"=>"1"}
