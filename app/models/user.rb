class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :boats, :foreign_key => "owner_id"

  has_many :positions_users
  has_many :positions, through: :positions_users

  has_many :race_crews, :foreign_key => "crew_id"
  has_many :races, through: :race_crews
  has_many :race_positions, through: :race_crews, :foreign_key => "race_position_id"

  validates :first_name, :last_name, :email, :phone_number, :weight, presence: true

  accepts_nested_attributes_for :positions_users

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.id).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end

  def self.new_with_session(params, session) #if user signup via OmniAuth fails model validations, provide error messages for user to make corrections
    if session["devise.user_attributes"]
      new session["devise.user_attributes"] do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required? #overrides validation requirement for user sign-up to give password when using OmniAuth
    super && provider.blank?
  end

  def name
    self.first_name + " " + self.last_name
  end

  # def position_ids=(pos_ids)
  #   pos_ids.each do |id|
  #     self.positions << Position.find_by(id: id) if id !=""
  #   end
  # end

  # def positions=(position)
  #   self.positions << Position.find_by(name: position[:name])
  # end

  def positions_users_attributes=(pu_attributes)
    pu_attributes.keep_if {|i, j| j[:position_id].to_i > 0}

    pu_attributes.each do |i, attributes|
      # binding.pry
      # self.positions_users.build(attributes)
      self.positions_users.find_or_initialize_by(attributes).update(attributes)
    end
  end

  def has_positions?(position)
    self.position_ids.include?(position.id)
  end

  def skill_level(position)
    self.positions_users.where("position_id = ?", position.id).first.skill_level
  end
end
