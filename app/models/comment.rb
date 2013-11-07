class Comment < ActiveRecord::Base
  has_many :commentvotes
  # Remember to create a migration!

end
