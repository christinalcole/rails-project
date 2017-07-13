require 'rails_helper'

Rspec.describe Crew, type: :model do
  before(:each) do
    @user = User.first
    @crew = Crew.create
    @position = Position.create(name: "main trim", user_id: @user.id, crew_id: @crew.id)
  end

  it "has many positions" do
    expect(@crew.positions).to include(@position)
  end

  it "has many users through positions" do
    expect(@crew.users).to include(@position)
  end
end
