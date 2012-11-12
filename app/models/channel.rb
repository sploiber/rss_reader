class Channel < ActiveRecord::Base
  attr_accessible :profile_id, :title, :url
  belongs_to :profile
  paginates_per 5
  validates_presence_of :title, :url
end
