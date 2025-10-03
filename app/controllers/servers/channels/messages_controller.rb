module Servers
  module Channels 
    class MessagesController < ApplicationController
      def create 
        @server = Server.find(params[:server_id])
        @channel = @server.channels.find(params[:channel_id])
        @message = @channel.messages.new(message_params)
        @message.user = current_user
        @message.save
        redirect_to server_channel_path(@server, @channel)
      end
      private
      def message_params 
        params.expect(channel_message: [ :body ])
      end
    end
  end
end