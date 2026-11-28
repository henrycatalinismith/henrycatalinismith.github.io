# Adds framing utility classes to images and videos in markdown post content, mirroring
# the `.prose` media styles. Hooks kramdown's HTML converter so only post content is
# affected, not layouts or includes (which don't go through markdown).
#
# Covers both markdown image syntax (`![alt](src)`) and raw HTML `<img>`/`<video>`
# tags written inside posts.
#
# The class list is a literal so Tailwind's source scanner generates the utilities.
module MediaFrame
  CLASSES = "block max-w-full h-auto border border-(--color-media-frame-border) rounded-md bg-(--color-media-frame-background) shadow-[0_0_0_1px_var(--color-media-frame-inner)_inset,0_12px_30px_var(--color-media-frame-shadow)]".freeze
  TAGS = %w[img video].freeze

  def self.add_classes(attr)
    attr["class"] = [attr["class"].to_s, CLASSES].reject(&:empty?).join(" ")
  end

  module Converter
    # Markdown images: `![alt](src)` inline, and standalone images in a paragraph.
    def convert_img(el, indent)
      MediaFrame.add_classes(el.attr)
      super
    end

    # Raw HTML: `<img>` or `<video>` written directly in the post source.
    def convert_html_element(el, indent)
      MediaFrame.add_classes(el.attr) if MediaFrame::TAGS.include?(el.value)
      super
    end
  end
end

Kramdown::Converter::Html.prepend(MediaFrame::Converter)
