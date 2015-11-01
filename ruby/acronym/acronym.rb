module Acronym
  VERSION = 1

  def self.abbreviate(text)
    text
      .scan(/\b(\w)|[a-z]([A-Z])/)
      .map do |first_letter, camel_case|
        (first_letter || camel_case).upcase
      end.join
  end
end
