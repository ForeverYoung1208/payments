module ApplicationHelper

  def glyph_link_to(glyph, text, *args, &block)
  	link_to(*args, &block) do
  		capture do	
  		concat content_tag("span",)


  		end
  	end
  end
end
