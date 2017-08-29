class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :boats, :foreign_key => "owner_id"

  has_many :race_crews, :foreign_key => "crew_id"
  has_many :races, through: :race_crews
  has_many :positions, through: :race_crews

  validates :first_name, :last_name, :email, :phone_number, :weight, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.id).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end
end
