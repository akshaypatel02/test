class HomeController < ApplicationController
  #before_action :authenticate_user!
  layout "profile", only: [:profile]
  
  def index
    @messages = Message.all
  end
  
  def profile
    @messages = Message.all
    @userMessages = Array.new
    @messages.each do |message|
      if message.user_id == current_user.id
        @userMessages.push(message)
      end
    end
    
    @privateMessages = PrivateMessage.all
    @inbox = Array.new
    @privateMessages.each do |message|
      if message.to == current_user.email
        @inbox.push(message)
      end
    end
  end
  
end
