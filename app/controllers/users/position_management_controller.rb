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
    raise params.inspect
    # binding.pry
    if current_user.update(user_position_params)
      redirect_to user_positions_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def user_position_params
    params.require(:user).permit(:user_id, :position_ids[], positions_users_attributes: [:skill_level])
  end
end

# <ActionController::Parameters {"utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"0DGcIiju/zzDHvfNK1bfvUwJ+BU91Kn4a22HpR/qjPdzoPlSCwHfREBZpHmGonQG4iIgaIegwiXMQ/RRZoY24Q==", "user"=>{"positions_users"=>[{"position_id"=>"", "skill_level"=>""}, {"position_id"=>""}, {"position_id"=>"2", "skill_level"=>"1"}]}, "commit"=>"Manage Position(s)", "controller"=>"users/position_management", "action"=>"update", "user_id"=>"1"} permitted: false>
