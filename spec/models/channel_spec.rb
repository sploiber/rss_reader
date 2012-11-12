require 'spec_helper'

describe Channel do
  
  before(:each) do
    @attr = { 
      :title => "Barack Obama",
      :url => "http://www.whitehouse.gov"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Channel.create!(@attr)
  end
  
  it "should require a title" do
    no_title = Channel.new(@attr.merge(:title => ""))
    no_title.should_not be_valid
  end
  
  it "should require a url" do
    no_url = Channel.new(@attr.merge(:url => ""))
    no_url.should_not be_valid
  end
  
end
