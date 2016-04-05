User.transaction do

User.create( :email => 'test2@depot.com', :password => 'changeme', :password_confirmation => 'changeme', :role => "User", :points => 59)

end