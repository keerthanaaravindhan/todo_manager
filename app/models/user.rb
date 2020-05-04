class User < ApplicationRecord
  has_secure_password
  has_many :todos                                                                                                                                                                                                                                                                                                                                                                                                                   
  def looks
    "#{id}  #{name}  #{email} "
  end
end
