class Channel::Message < ApplicationRecord
  belongs_to :server_channel, class_name: "Server::Channel"
  belongs_to :user

  after_create_commit :broadcast_new_message

  private 
  def broadcast_new_message 
      broadcast_append_to(server_channel, target: "messages", partial: "servers/channels/message",
        locals: {message: self } )
  end 
end
