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
			background-color: #{convert_hex_to_rgb(@post.user.col_color,@post.user.column_opacity)};
			
			color: ##{@post.user.font_color};
			font-size: #{@post.user.font_size};
		}
		
		.rhs {
			
			background-color: #{convert_hex_to_rgb(@post.user.col_color,(@post.user.column_opacity.to_f*1.5).to_s)};
		
		}

		.post_title, h1, h2, h3, h4, h5, h6 {
			font-size: #{@post.user.title_size};
			color: ##{@post.user.title_color};
		}

		a {
			color: ##{@post.user.link_color};
		}

		.navbar-inverse .navbar-inner { /* such a pain to find and set... */
  			background-color: ##{@post.user.col_color};
  			background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.3) 0%, #{convert_hex_to_rgb(@post.user.col_color,0.5)} 100%);
  			background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3) 0%, #{convert_hex_to_rgb(@post.user.col_color,0.5)} 100%);
  
		}
		"
		
	

  end
  def convert_hex_to_rgb(color, a)
  	r = color[0].hex*16 + color[1].hex
  	g = color[2].hex*16 + color[3].hex
  	b = color[4].hex*16 + color[5].hex
  	return "rgba(#{r},#{g},#{b},#{a})"
  end

 
end


  	
  	