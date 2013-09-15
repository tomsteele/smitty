module Smitty
  # Prints variable amount of messages and exits
  def self.croak(*messages)
    messages.each { |message| puts "Error: #{message}"}
    exit(1)
  end
end