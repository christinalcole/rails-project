class Users::BoatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boats = current_user.boats
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = current_user.boats.build(boat_params)

    if @boat.save
      redirect_to user_boats_path
      flash[:notice] = "Boat successfully added to the database"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])

    if @boat.update(boat_params)
      redirect_to user_boats_path
      flash[:notice] = "Boat successfully updated"
    else
      render :edit
    end
  end

  def destroy
    Boat.find(params[:id]).destroy
    redirect_to user_boats_path(current_user.id)
  end

  private
  def boat_params
    params.require(:boat).permit(:name, :make, :length, :rating)
  end
end

{"utf8"=>"✓",
 "authenticity_token"=>"KZxUKMe2QH1ZFczIWYLaEZ1M2Bv+ZpEFptWevivUDSHnswldF7KBPYYqdRLCYMmBa+/DYCOElKoG4htw/T4OSQ==",
 "boat"=>{"name"=>"Pipe", "make"=>"Beneteau", "length"=>"40", "rating"=>""},
 "commit"=>"Create Boat",
 "user_id"=>"2"}
