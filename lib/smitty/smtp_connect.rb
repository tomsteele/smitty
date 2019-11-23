require 'net/smtp'

module Smitty
  def self.smtp_connect(server, port, ssl, username, password, ignorecert)
    begin
      smtp_server = server.nil? ? 'localhost' : server
      smtp_port = port.nil? ? 25 : port.to_i
      smtp_conn = Net::SMTP.new(smtp_server, smtp_port)
      if ssl
        if ignorecert
          context = Net::SMTP.default_ssl_context
          context.verify_mode = OpenSSL::SSL::VERIFY_NONE
          smtp_conn.enable_starttls(context)
        else
          smtp_conn.enable_starttls()
        end
      end
      if username
        Smitty.croak('No password provided') if password.nil?
        if ssl
          smtp_conn.start(smtp_server, username, password, :login)
        else
          smtp_conn.start(smtp_server, username, password, :plain)
        end
      else
        smtp_conn.start()
      end
      smtp_conn
    rescue Exception => e
      Smitty.croak("Could not connect to SMTP server #{smtp_server}:#{smtp_port}", e.message)
    end
  end
end
