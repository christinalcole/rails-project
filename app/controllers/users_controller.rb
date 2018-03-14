class UsersController < ApplicationController

  def edit #allow user to update positions on profile
    @positions = Position.all
  end

  def update
    raise params.inspect
    if current_user.update(user_params)
      redirect_to user_positions_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(position_ids: [])
  end
end
