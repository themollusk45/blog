module ApplicationHelper
	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Mugen Blog"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def show_blog_bg
		"background:transparent url(#{@post.user.logo}) no-repeat fixed left top;"
	end
end

