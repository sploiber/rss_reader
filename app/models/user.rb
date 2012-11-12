class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :login, :provider, :uid
  # attr_accessible :title, :body

  has_one :profile, :dependent => :destroy

  validates_presence_of :first_name, :last_name, :login
  validates_uniqueness_of :login, :email, :case_sensitive => false
  validates_length_of :login, :minimum => 2, :maximum => 50
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :minimum => 2, :maximum => 50
  def full
    "#{first_name} #{last_name}"
  end
end
