# Generate an empty "header.html" and "footer.html" for all folders in in

module HeaderFooterPlugin
  class HeaderFooterGenerator < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      base_dir = File.join(site.source, "files")

      footers = []
      site.pages.each do |page|
        if page.data["layout"] == "listings" then
          footers << FooterPage.new(site, page)
        end
      end

      footers.each do |footer|
        site.pages << footer
      end
      #iter_folders(site, base_dir)
    end

    # def iter_folders(site, dir)
    #   site.pages << HeaderFooterPage.new(site, dir, "header2")
    #   site.pages << HeaderFooterPage.new(site, dir, "footer2")
    #   Dir.each_child(dir) do |child|
    #     child_path = File.join(dir, child)
    #     if File.directory?(child_path) then
    #       iter_folders(site, child_path)
    #     end
    #   end
    # end
  end

  class FooterPage < Jekyll::Page
    def initialize(site, page)
      @site = site
      @base = site.source
      @dir = page.dir
      @basename = "footer"
      @ext = page.ext
      @name = @basename + @ext
      @data = page.data.dup()
      @content = ""
      @data["layout"] = "listings-footer"
    end
  end
end
