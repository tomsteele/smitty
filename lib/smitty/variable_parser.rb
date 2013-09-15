module Smitty
  def self.variable_parser(variable_string)
    pairs = variable_string.split('=')
    # content is a file
    begin
      with_content = File.readlines(pairs[1]).map(&:chomp)
    rescue Errno::ENOENT
      with_content = pairs[1]
    rescue
      croak("Could not parse key value pair #{variable_string}")
    end
    {replace_string: pairs[0], with: with_content }
  end
end