module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def markdown_to_html(markdown_text)
    require 'kramdown'
    require 'sanitize'
    
    # Converts Markdown syntax to html tags.
    html = Kramdown::Document.new(markdown_text, :auto_ids => false).to_html
    
    # Setup whitelist of html elements, attributes, and protocols that are allowed.
    allowed_elements = ['a', 'p', 'ul', 'ol', 'li', 'strong', 'em', 'cite', 
      'blockquote', 'code', 'pre', 'dl', 'dt', 'dd', 'br', 'h2']
    allowed_attributes = {'a' => ['href']}
    allowed_protocols = {'a' => {'href' => ['http', 'https', 'mailto', :relative]}}
    
    # Clean text of any unwanted html tags.
    html = Sanitize.clean(html, :elements => allowed_elements, :attributes => allowed_attributes, 
      :protocols => allowed_protocols)
  end
  
  def truncated_text(markdown_text)
    html = markdown_to_html(markdown_text)
    require 'sanitize'
    html = Sanitize.clean(html).strip
    html = truncate(html, :length => 250, :separator => ' ')
    return html
  end

end