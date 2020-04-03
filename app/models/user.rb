class User < ActiveRecord::Base
  def looks
    "#{id}  #{name}  #{email} "
  end
end
