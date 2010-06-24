class User < ActiveRecord::Base
 
	validates_inclusion_of :gender, :in => %w( m f )
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
						:message => " est invalide"
  has_many :comments 
  has_many :adhesions
  has_many :groups, :through => :adhesions 
  has_many :sessions, :dependent => :destroy
 
 

 
 
 
  def self.find_by_name_and_password(name, password)
    user = self.find_by_email(name)	
    if user and user.password == password
      return user
    end
  end
  
  def is_admin?
	if self.id == 2
		puts "ok"
	 return true 
	else
	 return false 
	end
  end
 
	
end

