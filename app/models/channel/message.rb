class Channel::Message < ApplicationRecord
  belongs_to :server_channel, class_name: "Server::Channel"
  belongs_to :user
end
