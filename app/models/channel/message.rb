class Channel::Message < ApplicationRecord
  belongs_to :server_channel
  belongs_to :user
end
