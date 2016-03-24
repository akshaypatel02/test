class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :email, uniqueness: { scope: [:title], message: "User is already associated with that group."}
  private
    before_save {|membership| membership.user_id = (User.find_by(email: membership.email)).id }
    before_save {|membership| membership.group_id = (Group.find_by(title: membership.title)).id }
end
