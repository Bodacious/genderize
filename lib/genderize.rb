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
        current_value = instance_variable_get("@#{col_name}")
        persist_value = Genderize::Gender.new(read_attribute(col_name))
        return current_value || instance_variable_set("@#{col_name}", persist_value)
      end

      # Writes to the DB column the new value for the gender attribute
      # Sets the instance varaible value too
      #
      # string - A String indicating the gender. Must be either 'm', "M", 'f' or "F".
      #
      # Raises ArgumentError if gender is not a single alphanumeric character "m" or "f"
      define_method "#{col_name}=" do |string|
        string = string.to_s.first
        unless string.to_s =~ /\A(m|f|n|)\Z/i
          raise ArgumentError, "Gender must be one of '', 'n', 'm', or 'f'"
        end
        write_attribute(col_name, string)

        instance_variable_set("@#{col_name}", Genderize::Gender.new(read_attribute(col_name)))
      end

    end

  end
end
