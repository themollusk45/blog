module PostsHelper
  def show_blog_bg
 	"body {
  	  background-image: url(/blog#{Image.find_by_id(@post.user.bg_image).image_file.url(:original)});   	
  	}"
	
  end

  def apply_custom_css
  	   
			
		"body {
			background-color: #{convert_hex_to_rgb(@post.user.bg_color,1)};
		}
		
		
		.center_column {	
			background-color: #{convert_hex_to_rgb(@post.user.col_color,0.5)};
			
			color: ##{@post.user.font_color};
			font-size: #{@post.user.font_size};
		}
		
		.rhs {
			
			background-color: #{convert_hex_to_rgb(@post.user.col_color,0.75)};
		
		}

		.post_title {
			font-size: #{@post.user.title_size};
			color: ##{@post.user.title_color};
		}"
		
	

  end
  def convert_hex_to_rgb(color, a)
  	r = color[0].hex*16 + color[1].hex
  	g = color[2].hex*16 + color[3].hex
  	b = color[4].hex*16 + color[5].hex
  	return "rgba(#{r},#{g},#{b},#{a})"
  end
end


  	
  	