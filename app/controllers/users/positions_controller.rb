class Users::PositionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  # def new
  #   @position = Position.new
  #   @position.positions_users.build
  # end
  #
  # def create
  #   # raise.params.inspect
  #   # binding.pry
  #   user_position_params[:positions_users][:position_id].each do |p|
  #     current_user.positions << Position.find_by(id: p) if p!=""
  #   end
  #   # @positions = current_user.positions.build(user_position_params)
  #   # current_user.positions.delete_if { |position| position == "" }
  #   redirect_to user_path(current_user.id)
  # end
  #
  # private
  # def user_position_params
  #   params.require(:position).permit(positions_users: [position_id: []])
  # end
end

# {"utf8"=>"✓",
#  "authenticity_token"=>"kBhzTARzBShlBO2VrYpoejy21VCjNQgnIO+JJMtmkf3JifP/Spm+adVxp+l0QgLEDSYE0x52KOKsEJgqmR8pTg==",
#  "position"=>{"positions_users"=>{"position_id"=>["", "3"]}},
#  "commit"=>"Create Position",
#  "user_id"=>"1"}
