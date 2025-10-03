module Servers 
  class BaseController < ApplicationController
    protected 
    def authorize_owner!
      redirect_to root_path unless @server.owner ==  current_user
    end
  end
end