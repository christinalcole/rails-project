class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
  end
end
