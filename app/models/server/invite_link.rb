class Server::InviteLink < ApplicationRecord
  belongs_to :server

  before_validation :set_uniq_id, if: -> { !uniq_id.present? }

  delegate :name, to: :server, prefix: true
private 
  def set_uniq_id 
    self.uniq_id = SecureRandom.uuid
    save!
  end 
end
