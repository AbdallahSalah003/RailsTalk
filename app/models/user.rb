class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_user_numbers, if: -> { !user_numbers.present? }

  def set_user_numbers
    other_users_with_same_username = User.where("lower(username) like lower(?)", "%#{username}%")
    self.user_numbers =  other_users_with_same_username.count + 1
  end
end
