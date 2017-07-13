require 'rails_helper'

Rspec.describe Position, type: :model do
  before(:each) do
    @user = User.first
    @crew = Crew.create
    @position = Position.create(name: "main trim", user_id: @user.id, crew_id: @crew.id)
  end

  it "is has a name" do
    expect(@position.name).to_not be(nil)
  end

  xit "has and belongs to many users" do
    expect()
  end

  xit "has and belongs to many crews" do

  end

end
