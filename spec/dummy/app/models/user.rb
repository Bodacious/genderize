class User < ActiveRecord::Base
  attr_accessible :gender, :name
  
  genderize
  
  # test the genderize behaviour with a column of a different name
  genderize(:name)
end
