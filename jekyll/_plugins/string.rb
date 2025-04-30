# Various string manipulation filter that liquid sadly does not have
module StringFilters
  # Check if text has the given prefix
  def has_prefix(text, prefix)
    text.start_with? prefix
  end

  # Check if text has the given suffix
  def has_suffix(text, suffix)
    text.end_with? suffix
  end

  # Remove extension (last .XXX of path)
  # index -> index
  # index.html -> index
  # index.html.fr -> index.html
  def strip_extension(path)
    # We need to flip because lazy regex matches dont work well with end conditions
    # I.E. /\..+?$/ matches ".html.fr" in "index.html.fr", and not just ".fr"
    path.reverse().sub(/^.+?\./, '').reverse()
  end

  # Return extension of path, without leading dot
  # index -> ""
  # index.html -> html
  # index.html.fr -> fr
  def extension(path)
    if path.include? '.' then
      path.sub(/^.*\./, '')
    else
      ""
    end
  end

  # If the text has the given prefix, remove it
  def strip_prefix(text, prefix)
    if has_prefix(text, prefix) then
      text[prefix.length..]
    else
      text
    end
  end

  # If the text has the given suffix, remove it
  def strip_suffix(text, suffix)
    if has_suffix(text, suffix) then
      text[..-suffix.length]
    else
      text
    end
  end
end

Liquid::Template.register_filter(StringFilters)
