require 'spec_helper'

describe Profile do
  
  before(:each) do
    @attr = { 
      :name => "Siddhartha"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Profile.create!(@attr)
  end
  
  it "should require a name" do
    no_name = Profile.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
  it "should reject duplicate names" do
    Profile.create!(@attr)
    user_with_duplicate_name = Profile.new(@attr)
    user_with_duplicate_name.should_not be_valid
  end
  
  it "should reject names identical up to case" do
    upcased_name = @attr[:name].upcase
    Profile.create!(@attr.merge(:name => upcased_name))
    user_with_duplicate_name = Profile.new(@attr)
    user_with_duplicate_name.should_not be_valid
  end
  
  it "should reject a long name" do
    string = (0..50).map{('a'..'z').to_a[rand(26)]}.join
    long_name = Profile.new(@attr.merge(:name => string))
    long_name.should_not be_valid
  end

end
