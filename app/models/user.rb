class User < ActiveRecord::Base
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
						:message => " est invalide"
	has_many :comments 
	has_many :adhesions
	has_many :groups, :through => :adhesions 
end
