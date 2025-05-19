# Ruby plugin to autopopulate some data files
# For instance:
# - Adding a "news" item for accepted publications, talks
# - Generating some fields from easy data
module DataPlugin
  class DataGenerator < Jekyll::Generator
    def generate(site)
      site.data["publications"].each do |publication|
        publication["year"] ||= publication["date"]["published"].year
        publication["month"] ||= "%02d" % publication["date"]["published"].month
      end
    end
  end
end
