class UserWithOpt < ActiveRecord::Base
  attr_accessible :gender

  genderize(:gender, set_invalid_to_nil: true, no_empty_string: true)
end
