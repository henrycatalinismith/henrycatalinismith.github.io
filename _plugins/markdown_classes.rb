# Adds classes to elements written in markdown: `section-heading` / `subsection-heading` on
# <h2> / <h3>, `markdown-blockquote` on <blockquote>, `inline-code` on inline <code>, and
# Tailwind list utilities on <ul> / <ol>.
# Hooks kramdown's converters, so raw HTML in layouts and includes is left alone.
module MarkdownClasses
  SECTION_HEADING = "section-heading".freeze
  SUBSECTION_HEADING = "subsection-heading".freeze
  BLOCKQUOTE = "markdown-blockquote".freeze
  INLINE_CODE = "inline-code".freeze
  # Literals so Tailwind's source scanner generates the utilities.
  UNORDERED_LIST = "list-disc pl-8 my-4 space-y-1 [&_ul]:my-1 [&_ol]:my-1".freeze
  ORDERED_LIST = "list-decimal pl-8 my-4 space-y-1 [&_ul]:my-1 [&_ol]:my-1".freeze

  def self.add_class(el, name)
    el.attr["class"] = [el.attr["class"].to_s, name].reject(&:empty?).join(" ")
  end

  module Converter
    def convert_header(el, indent)
      MarkdownClasses.add_class(el, MarkdownClasses::SECTION_HEADING) if el.options[:level] == 2
      MarkdownClasses.add_class(el, MarkdownClasses::SUBSECTION_HEADING) if el.options[:level] == 3
      super
    end

    def convert_blockquote(el, indent)
      MarkdownClasses.add_class(el, MarkdownClasses::BLOCKQUOTE)
      super
    end

    def convert_ul(el, indent)
      MarkdownClasses.add_class(el, MarkdownClasses::UNORDERED_LIST)
      super
    end

    # kramdown aliases convert_ol to the original convert_ul, so it needs its own hook.
    def convert_ol(el, indent)
      MarkdownClasses.add_class(el, MarkdownClasses::ORDERED_LIST)
      super
    end

    def convert_codespan(el, indent)
      MarkdownClasses.add_class(el, MarkdownClasses::INLINE_CODE)
      super
    end
  end
end

Kramdown::Converter::Html.prepend(MarkdownClasses::Converter)
