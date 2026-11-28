require "tmpdir"
require "fileutils"
require "shellwords"

REPO = "git@github.com:henrycatalinismith/henrycatalinismith.github.io.git"

def moon_emoji(time = Time.now.utc)
  synodic_month = 29.530588853
  known_new_moon = Time.utc(2000, 1, 6, 18, 14)
  age = ((time - known_new_moon) / 86_400.0) % synodic_month
  phases = %w[🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘]
  phases[((age / synodic_month) * 8).round % 8]
end

desc "Build the site"
task :build do
  sh({ "JEKYLL_ENV" => "production" }, "bundle exec jekyll build")
end

desc "Push _site to the gh-pages branch"
task publish: :build do
  sha = `git rev-parse --short HEAD`.strip
  Dir.mktmpdir do |dir|
    FileUtils.cp_r("_site/.", dir)
    Dir.chdir(dir) do
      sh "git init --quiet"
      sh "git checkout --quiet -b gh-pages"
      sh "git add --all"
      sh "git", "commit", "--quiet", "-m", sha
      sh "git push --force #{REPO} gh-pages"
    end
  end
end

desc "Commit all local changes with a moon emoji message"
task :commit do
  sh "git add --all"
  sh "git", "commit", "-m", moon_emoji
end

desc "Push a single-commit squash of HEAD to main"
task :squash, :commit do
  commit = `git commit-tree HEAD^{tree} -m #{moon_emoji}`.strip
  abort "git commit-tree failed" unless $?.success? && !commit.empty?
  sh "git push --force #{REPO} #{commit}:refs/heads/main"
end

desc "Push the full history origin"
task :push do
   sh "git push origin main"
end

desc "Publish the site and squash history"
task deploy: %i[build commit publish squash push]

POST_TITLE_ARGS = ARGV.drop_while { |a| a != "post" }.drop(1)
POST_TITLE_ARGS.each { |a| task(a) {} }

desc "Create a new post and open it in nvim"
task :post, [:title] do |_, args|
  title = args[:title] || POST_TITLE_ARGS.join(" ")
  abort 'usage: rake post "Post title"' if title.empty?
  slug = title.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-|-\z/, "")
  abort "Title produced an empty slug" if slug.empty?
  path = "_posts/#{Time.now.strftime("%Y-%m-%d")}-#{slug}.md"
  abort "#{path} already exists" if File.exist?(path)
  File.write(path, <<~MD)
    ---
    title: #{title.include?(":") ? title.inspect : title}
    layout: layout-post
    ---

  MD
  exec "nvim", "+", path
end


IMAGE_EXTS = %w[.jpg .jpeg .png .webp .heic .tif .tiff .bmp .avif]
ASSET_PATTERN = /\A\d{4}-\d{2}-\d{2}-[a-z0-9]+(?:-[a-z0-9]+)*@\d+x\d+\.webp\z/
REFERENCE_GLOBS = %w[
  _posts/**/* _projects/**/* _data/**/* _includes/**/* _layouts/**/*
  _roles/**/* _education/**/* _certifications/**/*
  blog/**/* cv/**/* opensource/**/* *.html *.md *.xml *.css *.js
]

def asset_url(name)
  name.sub(/\A(\d{4})-(\d{2})-(\d{2})-/, '/\1/\2/\3/')
end

desc "Normalise image filenames in _assets to yyyy-mm-dd-slug@wxh.webp"
task :assets do
  renames = {}

  Dir.glob("_assets/*").sort.each do |path|
    name = File.basename(path)
    ext = File.extname(name).downcase
    next unless IMAGE_EXTS.include?(ext)
    next if name.match?(ASSET_PATTERN)

    stem = File.basename(name, File.extname(name)).sub(/@\d+x\d+\z/, "")
    date = stem[/\A\d{4}-\d{2}-\d{2}/] || Time.now.strftime("%Y-%m-%d")
    slug = stem.sub(/\A\d{4}-\d{2}-\d{2}-?/, "")
               .downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-|-\z/, "")
    slug = "image" if slug.empty?

    w, h = `magick identify -format "%w %h" #{Shellwords.escape("#{path}[0]")}`.split.map(&:to_i)
    abort "Couldn't read dimensions of #{path}" unless w&.positive?

    target_name = "#{date}-#{slug}@#{w}x#{h}.webp"
    target = File.join("_assets", target_name)
    if File.exist?(target) && !File.identical?(path, target)
      abort "#{target} already exists" unless FileUtils.compare_file(path, target)
      FileUtils.rm(path)
    elsif ext == ".webp"
      FileUtils.mv(path, target)
    else
      sh "magick", "#{path}[0]", "-quality", "85", target
      FileUtils.rm(path)
    end
    renames[name] = target_name
    renames[asset_url(name)] = asset_url(target_name)
    puts "#{name} → #{target_name}"
  end

  next if renames.empty?

  Dir.glob(REFERENCE_GLOBS).select { |f| File.file?(f) }.each do |file|
    content = File.read(file)
    updated = renames.reduce(content) { |c, (from, to)| c.gsub(from, to) }
    next if updated == content
    File.write(file, updated)
    puts "updated references in #{file}"
  end
end

VIDEO_EXTS = %w[.mp4 .mov .m4v .webm .mkv]
VIDEO_PATTERN = /\A\d{4}-\d{2}-\d{2}-[a-z0-9]+(?:-[a-z0-9]+)*@\d+x\d+\.(?:mp4|mov|m4v|webm|mkv)\z/

desc "Normalise video filenames in _assets and extract a webp poster for each"
task :videos do
  renames = {}

  Dir.glob("_assets/*").sort.each do |path|
    name = File.basename(path)
    ext = File.extname(name).downcase
    next unless VIDEO_EXTS.include?(ext)
    next if name.match?(VIDEO_PATTERN)

    stem = File.basename(name, File.extname(name)).sub(/@\d+x\d+\z/, "")
    date = stem[/\A\d{4}-\d{2}-\d{2}/] || Time.now.strftime("%Y-%m-%d")
    slug = stem.sub(/\A\d{4}-\d{2}-\d{2}-?/, "")
               .downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-|-\z/, "")
    slug = "video" if slug.empty?

    w, h = `ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0:s=x #{Shellwords.escape(path)}`
      .strip.split("x").map(&:to_i)
    abort "Couldn't read dimensions of #{path}" unless w&.positive?

    target_name = "#{date}-#{slug}@#{w}x#{h}#{ext}"
    target = File.join("_assets", target_name)
    poster = File.join("_assets", "#{date}-#{slug}-poster@#{w}x#{h}.webp")
    abort "#{target} already exists" if File.exist?(target) && !File.identical?(path, target)
    abort "#{poster} already exists" if File.exist?(poster)

    sh "ffmpeg -v error -i #{Shellwords.escape(path)} -frames:v 1 -f image2pipe -c:v png - " \
       "| magick png:- -quality 85 #{Shellwords.escape(poster)}"
    FileUtils.mv(path, target)
    renames[name] = target_name
    renames[asset_url(name)] = asset_url(target_name)
    puts "#{name} → #{target_name} (+ #{File.basename(poster)})"
  end

  next if renames.empty?

  Dir.glob(REFERENCE_GLOBS).select { |f| File.file?(f) }.each do |file|
    content = File.read(file)
    updated = renames.reduce(content) { |c, (from, to)| c.gsub(from, to) }
    next if updated == content
    File.write(file, updated)
    puts "updated references in #{file}"
  end
end
