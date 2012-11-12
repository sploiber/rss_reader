class ProfileType < ActiveRecord::Base
  attr_accessible :name, :num_channels
  has_many :profiles
  validates_presence_of :name, :num_channels
  validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :name, :maximum => 10
end
