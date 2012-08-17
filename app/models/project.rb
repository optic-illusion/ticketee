class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  attr_accessible :name
  validates :name, :presence => true
end
