class Group < ActiveRecord::Base
    after_create :establish_membership
    
    def establish_membership
        Membership.create!(title: self.title, email: (User.find_by(id: self.user_id)).email)
        
    end
end
