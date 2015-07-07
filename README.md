# Cucumber::JsConsoleErrors

## Intro
This gem allows you to capture Javascript console errors that occur during the
execution of a cucumber test via the selenium driver. test will fail if there
are any Javascript errors. This gem does not depend on jQuery or any other
third party Javascript library.

## Installation

If you are using bundler, add this line to your application's Gemfile:

```ruby
gem 'cucumber-js_console_errors', :group => :test
```

And then execute:

    $ bundle

Or install it yourself using:

    $ gem install cucumber-js_console_errors

## Usage

In your app/views/layouts/application.html.erb file (or equivalent) include the
line

    <%=raw Cucumber::JsConsoleErrors::inject_script %>

This will include some Javascript code on your page (to capture any JS errors
that occur).

In features/support/env.rb or another support file, please add:

```ruby
require 'cucumber/js_console_errors/hooks'
```

Now when you run your cucumber suite any selenium-based cukes with
Javascript errors will give a message such as the following in the
cucumber output...

```
*** JavaScript Console Error: ReferenceError: require is not defined on
line 1 for http://127.0.0.1:47099/javascripts/main.js
(error location may be in a different file/linenumber if the test
environment is running minified Javascript) ***
```

Also, if you are using capybara-screenshot or something similar you
should see the error in the screenshot. Inspecting the HTML, if you
debug it, will also let you see the error (near the bottom of the HTML
source).

## Contributing

1. Fork it ( https://github.com/theirishpenguin/cucumber-js_console_errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
