class Group < ActiveRecord::Base
	has_many :adhesions
	has_many :users, :through => :adhesions 
end
