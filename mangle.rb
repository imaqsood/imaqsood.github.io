require 'securerandom'

HTML_FILE = 'minified-resume.html'
CSS_FILE = 'css/resume.min.css'
OUTPUT_CSS_FILE = 'css/m-resume.min.css'
OUTPUT_HTML_FILE = 'm-minified-resume.html'

# Generate a shorter, unique name using Base62 encoding
@counter = 0
BASE62 = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

def generate_mangled_name
  name = ""
  num = @counter
  while num >= 0
    name = BASE62[num % 62] + name
    num = (num / 62).floor - 1
  end
  @counter += 1
  name
end

# Parse CSS file and generate mappings for classes, IDs, and variables
def generate_mappings(css_content)
  mappings = {}

  # Capture CSS classes, IDs, and CSS variables (e.g., --var-name, --tw-border-spacing-x)
  css_content.scan(/(?:--)([\w-]+)/).flatten.uniq.each do |original_name|
    mappings[original_name] = generate_mangled_name
  end

  # Capture Tailwind variables (e.g., --tw-border-spacing-x)
  css_content.scan(/(?:\.)([\w\-\[\]\.\\\:%]+){/).flatten.uniq.each do |original_name|
    mappings[original_name] = generate_mangled_name
  end

  mappings
end

# Replace class names, IDs, and variables in CSS
def mangle_css(css_content, mappings)
  mappings.each do |original, mangled|
      css_content.gsub!(/\b#{Regexp.escape(original)}\b/, mangled)
      # Handle classes and IDs
      css_content.gsub!(/(\.|#)\b#{Regexp.escape(original)}\b(?!::after|::before)/, "\\1#{mangled}")
    end
  end
  css_content
end

# Replace class names, IDs, and variables in HTML
def mangle_html(html_content, mappings)
  mappings.each do |original, mangled|
    if original.start_with?('--')
      # Replace CSS variables in style attributes or inline styles
      html_content.gsub!(/\b#{Regexp.escape(original)}\b/, mangled)
    else
      # Replace classes and IDs
      html_content.gsub!(/(\bclass=["'][^"']*?)\b#{Regexp.escape(original)}\b/, "\\1#{mangled}")
      html_content.gsub!(/id=["']#{Regexp.escape(original)}["']/, "id=\"#{mangled}\"")
    end
  end
  html_content
end

# Read files
original_css = File.read(CSS_FILE)
original_html = File.read(HTML_FILE)

# Generate mappings and mangle files
mappings = generate_mappings(original_css)
mangled_css = mangle_css(original_css.dup, mappings)
mangled_html = mangle_html(original_html.dup, mappings)

# Write output files
File.write(OUTPUT_CSS_FILE, mangled_css)
File.write(OUTPUT_HTML_FILE, mangled_html)

puts "✅ Mangling complete! Check #{OUTPUT_CSS_FILE} and #{OUTPUT_HTML_FILE}."
