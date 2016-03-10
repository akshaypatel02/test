class Message < ActiveRecord::Base
  CATEGORY_TYPES = ["Urgent", "Job", "News", "Event"]
  belongs_to :user
end
