module ApplicationHelper

  def glyph_link_to(glyph, *args, &block)
  	link_to(*args) do
  		concat content_tag("span", nil, class: "glyphicon glyphicon#{glyph}")
  		concat ' '
  		concat capture &block
  	end
  end
end
