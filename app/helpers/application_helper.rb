module ApplicationHelper
  def head_javascript(path = nil, &block)
    if block
      (@head_javascript ||= []) << capture(&block)
    elsif path
      (@head_javascript_paths ||= []) << path
    else
      html = ""
      if paths = @head_javascript_paths
        paths.uniq.each do |path|
          html << javascript_include_tag(path)
        end
      end
      if script = @head_javascript
        html << javascript_tag(script.uniq.join("\n"))
      end
      return html.html_safe
    end
  end

  def head_style(path = nil, &block)
    if block
      (@head_style ||= []) << capture(&block)
    elsif path
      (@head_stylesheet_paths ||= []) << path
    else
      html = ""
      if paths = @head_stylesheet_paths
        paths.uniq.each do |path|
          html << stylesheet_link_tag(path)
        end
      end
      if style = @head_style
        html << content_tag(:style, style.uniq.join("\n"), :type => "text/css")
      end
      return html.html_safe
    end
  end
end
