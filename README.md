# Smitty

Smitty is a mail client that allows you to use handlebars like HTML templates. It supports all the things you would expect out a mail client. Internally it uses [mail](https://github.com/mikel/mail) for creation and [premailer](https://github.com/alexdunae/premailer/) for inline css. Generation for Multi-Part messages is all done for you.

Smitty doesn't use everything that is available in handlebars, it only does replacement for variables. What this allows you to do is create nice looking HTML templates in a proper editor, and then do quick search and replace. 

For example, say you wanted to loop over a set of emails and names, inserting a different name for the corresponding email. In your template, you would put {{name}} in the place where you wanted replacement to occur, write your names and email addresses in 'names.txt' and 'emails.txt' respectively, and call smitty like so. Assume your template is in template.hbs.

    ./smitty from@someplace.io emails.txt 'YO {{name}}' template.hbs --vars 'name=names.txt' 
    
Smitty would then loop over each email address in emails.txt, replacing {{name}} with the corresponding name from names.txt. As you can see, variable names in the subject is also supported.

## Installation

Download the latest gem [here](https://github.com/tomsteele/smitty/releases/download/v0.0.2/smitty-0.0.2.gem) and install with gem:

    $ gem install smitty

Or build and install it yourself as:

    $ gem build smitty.gemspec
    $ gem install smitty

## Usage

    Smitty 0.0.2

    Usage:
      ./smitty [options] <from_address> <to_file> <subject> <template>
      ./smitty -h | --help
      ./smitty -v | --version

    Required Arguments:
      from_address:                    Address to send mail from.
      to_file:                         Newline separated file containing recipient addresses.
      subject:                         Mail subject, can have handlebar replacements.
      template:                        Handlebars like HTML template.

    Options:
      -h --help                        Show this usage.
      -v --version                     Show version.
      --vars key=value,key=value       Variables for template and subject line, should be a comma separated
                                       list of key value pairs. Key should be the variable name in your
                                       template, and value may be a constant or a newline separated file.
                                       Value file and to_file must have the same amount of lines.
      -a files                         Attach comma separated list of files.
      --server SERVER                  SMTP Server, default is localhost.
      --port PORT                      SMTP Port, default is 25.
      --ssl                            Use SSL, default is false.
      --username USER                  SMTP user.
      --password PASSWORD              SMTP password.
      --cc address                     Add a cc address.
      --bcc address                    Add a bcc address.
      --dry-run                        Output messages and don't send.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
