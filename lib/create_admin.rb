User.transaction do

User.delete_all
User.create( :email => 'admin@depot.com', :password => 'changeme', :password_confirmation => 'changeme')
end