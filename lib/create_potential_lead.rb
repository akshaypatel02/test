User.transaction do

User.create( :email => 'test2@depot.com', :password => 'changeme', :password_confirmation => 'changeme', :role => "User", :points => 59, :name => "Test Name", :address => "21 Test Ave")

end