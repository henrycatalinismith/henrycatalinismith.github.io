# Adds the `section-heading` class to <h2> headings written in markdown. Hooks kramdown's
# header converter, so raw HTML <h2> in layouts and includes is left alone.
module SectionHeading
  CLASS = "section-heading".freeze
  SUBCLASS = "subsection-heading".freeze

  module Converter
    def convert_header(el, indent)
      if el.options[:level] == 2
        el.attr["class"] = [el.attr["class"].to_s, SectionHeading::CLASS].reject(&:empty?).join(" ")
      end
      if el.options[:level] == 3
        el.attr["class"] = [el.attr["class"].to_s, SectionHeading::SUBCLASS].reject(&:empty?).join(" ")
      end
      super
    end
  end
end

Kramdown::Converter::Html.prepend(SectionHeading::Converter)
