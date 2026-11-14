# Turns bare URLs in markdown text into links, like GitHub-flavoured markdown.
# Rewrites kramdown's element tree before conversion, skipping text that's
# already inside a link or raw HTML.
module Autolink
  URL = %r{\bhttps?://[^\s<>"]+}i.freeze
  TRAILING_PUNCTUATION = /[.,:;!?'*_~]+\z/.freeze
  SKIP = %i[a html_element].freeze

  def self.link(root)
    root.children = root.children.flat_map do |child|
      if child.type == :text
        split(child)
      else
        link(child) unless SKIP.include?(child.type)
        [child]
      end
    end
    root
  end

  def self.split(el)
    text = el.value
    return [el] unless text.match?(URL)

    nodes = []
    pos = 0
    text.scan(URL) do
      match = Regexp.last_match
      url = trim(match[0])
      start = match.begin(0)
      nodes << Kramdown::Element.new(:text, text[pos...start]) if start > pos
      a = Kramdown::Element.new(:a, nil, { "href" => url })
      a.children << Kramdown::Element.new(:text, url)
      nodes << a
      pos = start + url.length
    end
    nodes << Kramdown::Element.new(:text, text[pos..]) if pos < text.length
    nodes
  end

  # Drops trailing punctuation and unbalanced closing parens, as GFM does.
  def self.trim(url)
    loop do
      trimmed = url.sub(TRAILING_PUNCTUATION, "")
      trimmed = trimmed[0..-2] if trimmed.end_with?(")") && trimmed.count(")") > trimmed.count("(")
      return trimmed if trimmed == url
      url = trimmed
    end
  end

  module Converter
    def convert_root(el, indent)
      Autolink.link(el)
      super
    end
  end
end

Kramdown::Converter::Html.prepend(Autolink::Converter)
