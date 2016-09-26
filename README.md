# Genderize

Genderize is a simple Rails gem for adding gender helper methods to Rails models.

## Example


### Feminine

    # Setting the gender is simple - just set the attribute value to "m" or "f"
    @user = User.new(gender: "f")

    # This also works
    @user = User.new(gender: "female")

    # This gives us a few helper methods to add gender specific text to our views
    @user.gender.male? # => false
    @user.gender.name # => "female"
    @user.gender.to_s # => "f"
    @user.gender.abbr # => "f"

    # gender pronouns
    # As the subject of a sentence
    @user.gender.subject # => 'she'

    # As the object of a sentence
    @user.gender.object # => 'her'

    # Showing possession
    @user.gender.possessive # => 'her'

    # Writing a casual form of the gender
    @user.gender.casual # => "girl"

### Masculine

    # Setting the gender is simple - just set the attribute value to "m" or "f"
    @user = User.new(gender: "m")

    # This also works
    @user = User.new(gender: "male")

    # This gives us a few helper methods to add gender specific text to our views
    @user.gender.female? # => false
    @user.gender.name # => "male"
    @user.gender.to_s # => "m"
    @user.gender.abbr # => "m"

    # gender pronouns
    # As the subject of a sentence
    @user.gender.subject # => 'he'

    # As the object of a sentence
    @user.gender.object # => 'him'

    # Showing possession
    @user.gender.possessive # => 'his'

    # Writing a casual form of the gender
    @user.gender.casual # => "guy"

### Blank (no gender specified)

    @user = User.new(gender: "")

    # This gives us a few helper methods to add gender specific text to our views
    @user.gender.female? # => false
    @user.gender.male? # => false
    @user.gender.name # => ""
    @user.gender.to_s # => ""
    @user.gender.abbr # => ""

    # gender pronouns
    # As the subject of a sentence
    @user.gender.subject # => 'they'

    # As the object of a sentence
    @user.gender.object # => 'them'

    # Showing possession
    @user.gender.possessive # => 'their'

    # Writing a casual form of the gender
    @user.gender.casual # => "person"

## Changing these values

You can change the values for each of the methods described above by modifying your locales file. See [config/locales/en.yml](config/locales/en.yml) for more info.

## Installation

Add this to your Gemfile:


    gem "genderize"

...and run `bundle install` to install the gem.

Next, run:

    $ rails g genderize:install

... to install the genderize.en.yml file in your locales directory

Finally, to *genderize* a model attribute:


    class User < ActiveRecord::Base

      genderize

      # ... or, if your db column isn't named `gender`
      genderize(:user_gender)

    end


## Issues

If you discover a problem with Genderize, please let us know about it.

**Remember** to search the [issues list](https://github.com/KatanaCode/genderize/issues) first in case your issue has already been raised
by another Githuber

## Documentation

Full documentation is available here: http://rubydoc.info/gems/genderize

## Contributing

You're welcome to contribute to Genderize.

## Legal Stuff

Copyright 2013 [Katana Code Ltd.](http://katanacode.com)

See [LEGAL](MIT-LICENCSE) for full details.

## Credits

Developed by [Katana](http://katanacode.com)

## About Katana

Katana are [mobile and web app developers based in Edinburgh, Scotland](http://katanacode.com/ "Katana").