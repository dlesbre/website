# Generate alternative language pages
# I.E. does nothing for pages with permalink ending in .html.fr or .html.en
# But for pages with permalink ending in .html:
# - Change it to .html.<page.lang> (or .fr if no page.lang)
# - Create a copy for the other language (so .en if page.lang=fr), adding a disclaimer
#   "this page is only available in french" at the top of the content.
module LanguageAlternatePagePlugin
  class LanguageAlternateGenerator < Jekyll::Generator
    def generate(site)
      alt_pages = []
      site.pages.each do |page|
        if page.url.end_with? '.html' then
          alt_pages << page
        end
      end
      alt_pages.each do |page|
        # Delete and recreate page, since side-effects mean the URL can't
        # easily be changed
        site.pages.delete(page)
        site.pages << LanguageAlternatePage.new(site, page, "fr")
        site.pages << LanguageAlternatePage.new(site, page, "en")
      end
    end
  end

  class LanguageAlternatePage < Jekyll::Page
    def initialize(site, page, lang)
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
      @data["permalink"] = page.url + '.' + lang
    end
  end
end
