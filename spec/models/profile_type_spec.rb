require 'spec_helper'

describe ProfileType do
  
  before(:each) do
    @attr = { 
      :name => "Basic",
      :num_channels => 10
    }
  end
  
  it "should create a new instance given a valid attribute" do
    ProfileType.create!(@attr)
  end
  
  it "should require a name" do
    no_name = ProfileType.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
  it "should reject duplicate names" do
    ProfileType.create!(@attr)
    user_with_duplicate_name = ProfileType.new(@attr)
    user_with_duplicate_name.should_not be_valid
  end
  
  it "should reject names identical up to case" do
    upcased_name = @attr[:name].upcase
    ProfileType.create!(@attr.merge(:name => upcased_name))
    user_with_duplicate_name = ProfileType.new(@attr)
    user_with_duplicate_name.should_not be_valid
  end
  
  it "should require a number of channels" do
    no_num_channels = ProfileType.new(@attr.merge(:num_channels => ""))
    no_num_channels.should_not be_valid
  end

  it "should reject a long name" do
    string = (0..10).map{('a'..'z').to_a[rand(26)]}.join
    long_name = ProfileType.new(@attr.merge(:name => string))
    long_name.should_not be_valid
  end

end
