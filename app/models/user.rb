#class User < ApplicationRecord
#  has_secure_password
#  has_many :todos                                                                                                                                                                                                                                                                                                                                                                                                                   
#  def looks
#    "#{id}  #{name}  #{email} "
#  end
#end

class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :todos
  
end