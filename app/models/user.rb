class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
   
   validates :email, presence => true, :format => { :with => \b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b}

   
  # attr_accessible :title, :body
end
