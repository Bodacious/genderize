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


    def genderize(col_name = "gender", opts = {})
      # Reads the DB column value for gender attribute and creates a new Gender
      # object with it's value
      #
      # The object is memoized for future calls.
      #
      # col_name - String or Symbol name of gender column (default 'gender')
      #
      # opts - Hash options to handle storage and initialization scenarios:
      #        :no_empty_string - Boolean. If true, stores empty string as nil
      #        :set_invalid_to_nil - Boolean. If true, sets the gender to be 
      #                              an unknown Gender instead of throwing an
      #                              ArgumentError
      #
      # Returns a Gender

      no_empty_string = !!opts[:no_empty_string] || false
      set_invalid_to_nil = !!opts[:set_invalid_to_nil] || false

      define_method col_name do
        current_value = instance_variable_get("@#{col_name}")
        persist_value = Genderize::Gender.new(read_attribute(col_name))
        return current_value || instance_variable_set("@#{col_name}", persist_value)
      end

      # Writes to the DB column the new value for the gender attribute
      # Sets the instance varaible value too
      #
      # string - A String indicating the gender. Valid parameters must have
      #          first letter be 'm', 'n', 'f' or ''. Case insensitive.
      #
      # Raises ArgumentError if gender isn't valid and set_invalid_to_nil is false
      define_method "#{col_name}=" do |string|
        string = string.to_s.first
        valid = string.to_s =~ /\A(m|f|n|)\Z/i

        unless valid
          if set_invalid_to_nil
            string = nil
          else
            raise ArgumentError, "Gender must be one of '', 'n', 'm', or 'f'"
          end
        end

        string = nil if (string == '' and no_empty_string)

        write_attribute(col_name, string)
        instance_variable_set("@#{col_name}", Genderize::Gender.new(read_attribute(col_name)))
      end

    end

  end
end
