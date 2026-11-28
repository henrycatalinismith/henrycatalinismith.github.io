require "htmlbeautifier"

# Re-indents rendered HTML pages and documents. HtmlBeautifier leaves the
# contents of <pre>, <textarea>, <script> and <style> untouched, but it
# mistakes a void element whose attributes span several lines (like a
# multi-line <img>) for an opening tag, so tags are flattened onto one
# line first.
module FormatHtml
  RAW = %r{(<(pre|textarea|script|style)\b.*?</\2>)}m
  MULTILINE_TAG = /<\/?[a-zA-Z][^<>]*\n[^<>]*>/

  def self.flatten_tags(html)
    html.split(RAW).each_slice(3).map do |text, raw, _name|
      text.gsub(MULTILINE_TAG) { |tag| tag.gsub(/\s+/, " ").sub(/ (\/?>)\z/, '\1') } + raw.to_s
    end.join
  end

  def self.format(item)
    return unless item.output_ext == ".html"
    return if item.output.nil? || item.output.empty?

    item.output = HtmlBeautifier.beautify(flatten_tags(item.output), indent: " ") + "\n"
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  FormatHtml.format(item)
end
