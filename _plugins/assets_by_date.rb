require "fileutils"

# Publishes _assets/yyyy-mm-dd-name.ext to _site/yyyy/mm/dd/name.ext,
# so assets keep the dated URLs they had on the old site.
module AssetsByDate
  PATTERN = /\A(\d{4})-(\d{2})-(\d{2})-(.+)\z/

  def self.copy(site)
    src = File.join(site.source, "_assets")
    return unless File.directory?(src)

    Dir.glob(File.join(src, "**", "*")).each do |path|
      next unless File.file?(path)

      name = File.basename(path)
      match = PATTERN.match(name)
      next unless match

      year, month, day, rest = match.captures
      dest = File.join(site.dest, year, month, day, rest)
      FileUtils.mkdir_p(File.dirname(dest))
      FileUtils.cp(path, dest)
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  AssetsByDate.copy(site)
end
