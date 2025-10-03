class Server < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :channels, class_name: "Server::Channel", foreign_key: "server_id"
  has_many :invite_links, class_name: "Server::InviteLink"
  has_many :memberships, class_name: "Server::Membership"
  has_one_attached :image
end
