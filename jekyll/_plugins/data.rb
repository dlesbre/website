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

        # Create a news item for attending publication conferences
        if publication["venue"]["attending"] then
          event = Hash.new
          event["date"] = publication["date"]["published"]
          event["type"] = "attending"
          event["event"] = "#{publication["venue"]["acronym"]} #{publication["year"]}"
          event["url"] = publication["venue"]["url"]
          event["location"] = publication["venue"]["location"]
          site.data["news"] << event
        end

        # Create a news item for accepted papers
        accepted = Hash.new
        accepted["date"] = publication["date"]["accepted"]
        accepted["type"] = "accepted-paper"
        accepted["paper"] = publication
        site.data["news"] << accepted
      end

      # Create a news item for invited talks
      site.data["talks"].each do |talk|
        event = Hash.new
        event["date"] = talk["date"]
        event["type"] = "invited-talk"
        event["talk"] = talk
        site.data["news"] << event
      end
    end
  end
end
