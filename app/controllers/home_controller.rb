class HomeController < ApplicationController
  #before_action :authenticate_user!
  layout "profile", only: [:profile, :leadCandidates]
  
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

    @userBookmarks = @current_user.find_up_voted_items
  end
  
 
  def calendar
    @events = Event.all
  end
 
  def leadCandidates
    @allUsers = User.where(:role => 'User')
    @possibleLeads = Array.new
    @allUsers.each do |user|
      if user.points > 50
        @possibleLeads.push(user)
      end
    end
  end
  
  def promote
    user = User.find(params[:id])
    user.update_column(:role, 1)
    redirect_to home_leadCandidates_path
  end
  
 
end
