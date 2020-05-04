class User < ApplicationRecord
  def looks
    "#{id}  #{name}  #{email} "
  end
end
