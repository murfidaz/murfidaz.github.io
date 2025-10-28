Jekyll::Hooks.register :site, :post_write do |site|
  Dir.mkdir("_site/tag") unless Dir.exist?("_site/tag")

  site.tags.each do |tag, posts|
    tag_page = File.join(site.dest, "tag", "#{tag}.html")
    File.open(tag_page, "w") do |file|
      file.puts("---")
      file.puts("layout: tag")
      file.puts("tag: #{tag}")
      file.puts("permalink: /tag/#{tag}/")
      file.puts("---")
    end
  end
end
