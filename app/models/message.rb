class Message < ActiveRecord::Base
  CATEGORY_TYPES = ["Urgent", "Job", "News", "Event"]
  belongs_to :user
  has_many :comments
end
