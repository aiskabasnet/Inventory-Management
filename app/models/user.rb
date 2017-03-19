class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 # attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :first_name, :middle_name, :last_name
  has_many :logs, :dependent => :destroy
end
