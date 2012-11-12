class Profile < ActiveRecord::Base
  attr_accessible :name, :profile_type_id, :user_id
  belongs_to :profile_type
  belongs_to :user
  has_many :channels, :dependent => :destroy
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :name, :maximum => 40
end
