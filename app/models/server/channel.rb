class Server::Channel < ApplicationRecord
  belongs_to :server
  has_many :messages, class_name: "Channel::Message", foreign_key: "server_channel_id"
end
