class Group < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :participates
  
  has_many :invitations
  
end
