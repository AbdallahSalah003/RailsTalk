class InvitationsController < ApplicationController
  before_action :set_invite_link 
  def show
  end 

  def create
      # handle creating membership to server
    redirect_to root_path, alert: "Invalid invite link" unless @invite_link.present?
    current_user.server_memberships.find_or_create_by(server: @invite_link.server)
    redirect_to root_path
  end 

  private 
  def set_invite_link 
    @invite_link = Server::InviteLink.find_by_uniq_id(params[:uniq_id])
  end
end