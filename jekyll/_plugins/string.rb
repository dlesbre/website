# Various string manipulation filter that liquid sadly does not have
module StringFilters
  def has_prefix(text, prefix)
    text.start_with? prefix
  end

  def has_suffix(text, suffix)
    text.end_with? suffix
  end

  def strip_extension(text)
    text.reverse().sub(/^.+?\./, '').reverse()
  end

  def extension(text)
    if text.include? '.' then
      text.sub(/^.*\./, '')
    else
      text
    end
  end

  def strip_prefix(text, prefix)
    if has_prefix(text, prefix) then
      text[prefix.length..]
    else
      text
    end
  end

  def strip_suffix(text, suffix)
    if has_suffix(text, suffix) then
      text[..-suffix.length]
    else
      text
    end
  end
end

Liquid::Template.register_filter(StringFilters)
