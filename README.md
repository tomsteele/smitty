# Smitty

Smitty is a mail client that allows you to use handlebars like HTML templates. It supports all the things you would expect out a mail client. Internally it uses [mail](https://github.com/mikel/mail) for creation and [premailer](https://github.com/alexdunae/premailer/) for inline css. Generation for Multi-Part messages is all done for you.

Smitty doesn't use everything that is available in handlebars, it only does replacement for variables. What this allows you to do is create nice looking HTML templates in a proper editor, and then do quick search and replace. 

For example, say you wanted to loop over a set of emails and names, inserting a different name for the corresponding email. In your template, you would put {{name}} in the place where you wanted replacement to occur, write your names and email addresses in 'names.txt' and 'emails.txt' respectively, and call smitty like so. Assume your template is in template.hbs.

    ./smitty from@someplace.io emails.txt 'YO {{name}}' template.hbs --vars 'name=names.txt' 
    
Smitty would then loop over each email address in emails.txt, replacing {{name}} with the corresponding name from names.txt. As you can see, variable names in the subject is also supported.

## Content-ID Embedded Images

Smitty includes the ability to generate Content-ID values for attached images and embed the content within the handlebars HTML template in accordance with [RFC2557](http://tools.ietf.org/html/rfc2557#page-8). Smitty will generate a Multi-Part email message and search the handlebar HTML template for image references associated with the attached image name.

    ./smitty from@someplace.io emails.txt 'Subject' -a someimage.jpg --cid tempalte.hbs

Smitty will then search through the template and replace references to \<img src="cid:{{someimage.jpg}}"\> with the Content-ID value of the attached image.

## Installation

    $ gem install smitty

Or build and install it yourself as:

    $ gem build smitty.gemspec
    $ gem install smitty

## Usage

    Smitty 1.0.0

    Usage:
      smitty [options] <from_address> <to_file> <subject> <template>
      smitty -h | --help
      smitty -v | --version

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
      --cid                            Enable CID embedding of images for email attachments, default is false.
      --server SERVER                  SMTP Server, default is localhost.
      --port PORT                      SMTP Port, default is 25.
      --ssl                            Use SSL, default is false.
  --ignorecert                     Ignore the SMTP server certificate when using --ssl.
      --username USER                  SMTP user.
      --password PASSWORD              SMTP password.
      --cc address                     Add a cc address.
      --bcc address                    Add a bcc address.
      --messageid FQDN                 Set a FQDN to use when generating the message-id for each message.
      --sleep SEC                      Sets sleep delay, in seconds, per each recipent.
      --dry-run                        Output messages and don't send.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
