module Smitty
  USAGE = <<DOC
Smitty #{Smitty::VERSION}

Usage:
  #{$0} [options] <from_address> <to_file> <subject> <template>
  #{$0} -h | --help
  #{$0} -v | --version

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

DOC
end
