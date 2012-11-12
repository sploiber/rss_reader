require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
      :first_name => "Shawn",
      :last_name => "Colvin",
      :login => "cover_girl",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should require an last name" do
    no_last_name = User.new(@attr.merge(:last_name => ""))
    no_last_name.should_not be_valid
  end

  it "should reject a short last name" do
    short_last_name = User.new(@attr.merge(:last_name => "A"))
    short_last_name.should_not be_valid
  end

  it "should reject a long last name" do
    string = (0..50).map{('a'..'z').to_a[rand(26)]}.join
    long_last_name = User.new(@attr.merge(:last_name => string))
    long_last_name.should_not be_valid
  end

  it "should require a first name" do
    no_first_name = User.new(@attr.merge(:first_name => ""))
    no_first_name.should_not be_valid
  end
  
  it "should reject a long first name" do
    string = (0..50).map{('a'..'z').to_a[rand(26)]}.join
    long_first_name = User.new(@attr.merge(:first_name => string))
    long_first_name.should_not be_valid
  end

  it "should require a login" do
    no_login = User.new(@attr.merge(:login => ""))
    no_login.should_not be_valid
  end
  
  it "should reject logins identical up to case" do
    upcased_login = @attr[:login].upcase
    User.create!(@attr.merge(:login => upcased_login))
    user_with_duplicate_login = User.new(@attr)
    user_with_duplicate_login.should_not be_valid
  end
  
  it "should reject a short login" do
    short_login = User.new(@attr.merge(:login => "A"))
    short_login.should_not be_valid
  end

  it "should reject a long login" do
    string = (0..50).map{('a'..'z').to_a[rand(26)]}.join
    long_login = User.new(@attr.merge(:login => string))
    long_login.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end
