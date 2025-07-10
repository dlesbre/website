# Generate alternative language pages
# I.E. does nothing for pages with permalink ending in .html.fr or .html.en
# But for pages with permalink ending in .html:
# - Change it to .html.<page.lang> (or .fr if no page.lang)
# - Create a copy for the other language (so .en if page.lang=fr), adding a disclaimer
#   "this page is only available in french" at the top of the content.
module LanguageAlternatePagePlugin
  class LanguageAlternateGenerator < Jekyll::Generator
    def generate(site)
      pages = []
      site.pages.each do |page|
        next if page.data["layout"] == "listings" or page.data["layout"] == "listings-footer"
        if page.url.end_with? '.en.html' or page.url.end_with? '.fr.html' then
          pages << {page: page, url: page.url[..-9], lang: page.data["lang"]}
        elsif page.url.end_with? '.html' then
          pages << {page: page, url: page.url[..-6], lang: "en"}
          pages << {page: page, url: page.url[..-6], lang: "fr"}
        end
      end
      pages.each do |page|
        # Delete and recreate page, since side-effects mean the URL can't
        # easily be changed
        site.pages.delete(page[:page])
        site.pages << LanguageAlternatePage.new(site, page[:page], page[:url], page[:lang])
      end
    end
  end

  class LanguageAlternatePage < Jekyll::Page
    def initialize(site, page, url, lang)
      # Create a new language page
      # URL is the permalink minus the extension (.html.<lang> added automatically)
      @site = site
      @base = site.source
      @dir = page.dir
      @basename = page.basename
      @ext = page.ext
      @name = @basename + @ext
      @data = page.data.dup()
      @content = page.content
      if lang != @data["lang"] then
        @data["lang-disclaimer"] = true
      end
      @data["lang"] = lang
      @data["permalink"] = url + '.html.' + lang
      # puts "generating #{@data["permalink"]}"
    end
  end
end
