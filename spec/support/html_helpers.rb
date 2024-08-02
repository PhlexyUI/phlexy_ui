module HTMLHelpers
  def html(string)
    string
      # Remove whitespace between HTML tags.
      .gsub(/>\s+</, "><")
      # Collapse newlines and spaces between attributes into a single space.
      .gsub(/(\S)\s*\n\s*(\S)/, '\1 \2')
      # Ensure there's no space after an opening quote followed by a word.
      .gsub(/"\s+(\w)/, '"\1')
      # Ensure there's a space after a closing quote if followed by a word.
      .gsub(/(\w)"(?=\w)/, '\1" ')
      # Remove leading and trailing whitespace.
      .strip
  end
end

RSpec.configure do |config|
  config.include HTMLHelpers
end
