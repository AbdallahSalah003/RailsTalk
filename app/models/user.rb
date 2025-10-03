class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_user_numbers, if: -> { !user_numbers.present? }
  has_many :owned_servers, class_name: "Server", foreign_key: "owner_id"
  has_many :server_memberships, class_name: "Server::Membership"
  has_many :joined_servers, through: :server_memberships, source: :server

  def set_user_numbers
    other_users_with_same_username = User.where("lower(username) like lower(?)", "%#{username}%")
    self.user_numbers =  other_users_with_same_username.count + 1
  end
end
