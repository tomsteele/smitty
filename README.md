# Smitty

Smitty is a mail client that allows you to use handlebars like templates.

## Installation

Add this line to your application's Gemfile:

    gem 'smitty'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem build smitty.gemspec
    $ gem install smitty

## Usage

    Smitty 0.0.1

    Usage:
      ./smitty [options] <from_address> <to_file> <subject> <template> <variables>
      ./smitty -h | --help
      ./smitty -v | --version

    Required Arguments:
      from_address:        Address to send mail from.
      to_file:             Newline separated file containing recipient addresses.
      subject:             Mail subject, can have handlebar replacements.
      template:            Handlebar like HTML template.
      variables:           Replacement variables for template and subject line,
                           should be a comma separated list of key value pairs. Key
                           should be the variable name in your template, and value may be
                           a constant or a newline separated file. Value file and to_file
                           must have the same amount of lines.
 
    Options:
      -h --help            Show this usage.
      -v --version         Show version.
      -a files             Attach comma separated list of files.
      --server SERVER      SMTP Server, default is localhost.
      --port PORT          SMTP Port, default is 25.
      --ssl                Use SSL, default is false.
      --username USER      SMTP user.
      --password PASSWORD  SMTP password.
      --dry-run            Output messages and don't send.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
