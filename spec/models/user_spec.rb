require 'rails_helper'

Rspec.describe User, type: :model do
  before(:each) do
    @user = User.first
    @crew = Crew.create
    @position = Position.create(name: "main trim", user_id: @user.id, crew_id: @crew.id)
  end

  it "is valid with a name, email address, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Ahab", email: "snowhill@whitewhale.com")).not_to be_valid
  end

  it "is not valid without an email address" do
    expect(User.new(name: "Ahab", password: "thar-blow$")).not_to be_valid
  end

  it "has many positions" do
    expect(@user.positions).to include(@position)
  end

  it "has many crews through positions" do
    expect(@user.crews).to include(@crew)
  end
end
