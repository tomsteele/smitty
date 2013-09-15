require 'net/smtp'

module Smitty
  def self.smtp_connect(server, port, ssl, username, password)
    begin
      smtp_server = server.nil? ? 'localhost' : server
      smtp_port = port.nil? ? 25 : port.to_i
      smtp_conn = Net::SMTP.new(smtp_server, smtp_port)
      smtp_conn.enable_tls() if ssl
      if username
        Smitty.croak('No password provided') if password.nil?
        smtp_conn.start(smtp_server, username, password, :plain)
      else
        smtp_conn.start()
      end
      smtp_conn
    rescue Exception => e
      Smitty.croak("Could not connect to SMTP server #{smtp_server}:#{smtp_port}", e.message)
    end
  end
end