require "genderize/gender"
require "genderize/engine"

unless Rails
  raise "Genderize is a Rails gem and expects to used in a Rails (3 or higher) application"
end

module Genderize
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods

    
    def genderize(col_name = "gender")
      # Reads the DB column value for gender attribute and creates a new Gender 
      # object with it's value
      #
      # The object is memoized for future calls.
      # 
      # Returns a Gender
      define_method col_name do
        if value = instance_variable_get("@#{col_name}")
          return value
        end
        read_value = read_attribute(col_name)
        if read_value.blank?
          return read_value
        else
          instance_variable_set("@#{col_name}", Genderize::Gender.new(read_attribute(col_name)))
        end
      end
      
      # Writes to the DB column the new value for the gender attribute
      # Sets the instance varaible value too
      #
      # string - A String indicating the gender. Must be either 'm', "M", 'f' or "F".
      #
      # Raises ArgumentError if gender is not a single alphanumeric character "m" or "f"
      define_method "#{col_name}=" do |string|
        unless string.blank? or string.to_s =~ /\A(m|f)\Z/i
          raise ArgumentError, "Gender must be a single alphanumeric character" 
        end
        write_attribute(col_name, string)
        
        if string.blank?
          instance_variable_set("@#{col_name}", string)
        else
          instance_variable_set("@#{col_name}", Genderize::Gender.new(read_attribute(col_name)))
        end
      end
      
    end
    
  end
end
