module HTMLHelpers
  def html(string)
    string
      # Remove whitespace between HTML tags.
      .gsub(/>\s+</, "><")
      # Collapse multiple newlines between attributes into a single space.
      .gsub(/(\S)\s*\n\s*(\S)/, '\1 \2')
      # Remove extra spaces within attribute values.
      .gsub(/(\w+)="\s*(.+?)\s*"/) { |m| "#{$1}=\"#{$2.split.join(" ")}\"" }
      # Ensure there's a single space after each attribute.
      .gsub(/(\S+="[^"]*")\s*/, '\1 ')
      # Remove space before closing bracket.
      .gsub(/\s+>/, ">")
      # Remove leading and trailing whitespace.
      .strip
  end
end

RSpec.configure do |config|
  config.include HTMLHelpers
end
