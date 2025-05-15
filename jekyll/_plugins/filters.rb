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

  # Variant of array_to_sentence_string that allows customizing the other connector
  def array_to_sentence(array, last_connector = "and", connector=", ")
    case array.length
    when 0
      ""
    when 1
      array[0].to_s
    when 2
      "#{array[0]} #{last_connector} #{array[1]}"
    else
      "#{array[0...-1].join(connector)}, #{last_connector} #{array[-1]}"
    end
  end

  # Pretty print a number with a unit:
  # pretty_size(123) -> "123 B"
  # pretty_size(1100000) -> "1.1 MB"
  def pretty_size(num, suffix="B", base=1000, sep=" ")
    base = base.to_f
    units = ["", "k", "M", "G", "T", "P", "E", "Z"]

    units.each do |unit|
      if num.abs < base then
        return format("%.1f%s%s%s", num, sep, unit, suffix)
      end
      num /= base
    end

    format("%.1f%sY%s", num, sep, suffix)
  end

  # Return the size of the given file, path is assumed to start with a slash "/"
  # and to be relative to the current working directory
  def file_size(path)
    if File.exist?(Dir.pwd + path) then
      File.size(Dir.pwd + path)
    else
      raise "File not found: #{Dir.pwd + path}"
    end
  end

  # Emit a warning
  def warn(message, context = nil)
    context ||= @context
    Kernel.warn "Liquid Warning:#{get_location(context)} #{message}"
  end

  # Emit an error
  def error(message, context = nil)
    context ||= @context
    raise RuntimeError, "Liquid Error:#{get_location(context)} #{message}"
  end

  # lang filter: usage {{ my_variable | lang: "en" }}
  # If my variable is a string, return it unchanged (no translation)
  # If my variable is a hash, return {{ my_variable["en"] }}
  def lang(text, lang, context = nil)
    context ||= @context
    if text.is_a?(Hash) then
      if text.key?(lang) then
        text[lang]
      else
        raise RuntimeError, "Liquid Error: #{get_location(context)} lang filter: hash has no key '#{lang}'"
      end
    elsif text.is_a?(String)
      text
    else
          raise RuntimeError, "Liquid Error:#{get_location(context)} lang filter: expected String or Hash"
    end
  end

  private

  # Get file name and line number
  def get_location(context)
    return "" unless context && context.registers

    page = context.registers[:page]
    return "" unless page

    file = page['path'] || 'unknown file'
    line = context.registers[:line_number] || '?'

    " #{file}:#{line}:"
  end
end

Liquid::Template.register_filter(StringFilters)
