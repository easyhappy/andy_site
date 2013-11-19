AndySite.helpers do
  def hot_blogs
    contents_tag :div, :class => :hot_blog do |contents|
      Blog.hot_blogs(5).each do |blog|
        contents << link_to(blog.title, blog_url(blog))
      end
    end
  end

  def blog_categories
    contents_tag :div, :class => :tag do |contents|
      Blog.cached_tag_cloud.select {|t| t.count > 2}.each do |tag|
        contents << link_to("#{tag.name}<span>#{tag.count}</span>".html_safe, url(:blog, :tag, :name => tag.name))
      end
    end
  end

  def recent_comments
    contents_tag :ul, :class => "comment" do |contents|
      BlogComment.order('id DESC').limit(5).each do |comment|
        contents << recent_comments_part(comment)
      end
    end 
  end

  private
  
  def recent_comments_part comment
    contents_tag :li do |contents|
      contents << content_tag(:div, "#{comment.brief_content}...")
      contents << "#{comment.account.name}评论了: "
      contents << link_to(comment.blog.title, blog_url(comment.blog), :anchor => 'comments')
    end
  end
end