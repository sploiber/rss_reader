Given /^there is a profile type called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:profile_type, :name => name, :num_channels => 10)
end
