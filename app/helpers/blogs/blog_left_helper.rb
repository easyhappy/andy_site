AndySite.helpers do
  def show_blog_header blog
    contents_tag :div, :class => "tit clearfix" do |contents|
      contents << blog_category_icon(blog)
      contents << link_to(blog.title, blog_url(blog))
      contents << blog_management(blog)
      
      contents.flatten!
    end
  end

  def show_blog_detail blog
    contents_tag :div, :class => "text" do |contents|
      contents << show_blog_detail_about_tag(blog)
      contents << blog.content.truncate(300)
    end
  end

  def show_blog_footer blog
    cache_blog = Blog.read_second_level_cache(blog.id)
    view_count = cache_blog ? cache_blog.view_count : blog.view_count

    content_tag :div, :class => "info clearfix" do
      contents_tag :div, :class => "fr" do |contents|
        contents << content_tag(:span, blog.account.name, :class => "author")
        contents << content_tag(:span, "#{time_ago_in_words(blog.created_at)}发表", :class => "time")
        contents << content_tag(:span, "#{time_ago_in_words(blog.content_updated_at)}更新", :class => "edit")
        contents << content_tag(:span, "#{view_count}次浏览", :class => "views")
        contents << link_to(blog.comments_count.to_s, blog_url(blog), :anchor => 'comments', :class => 'comment', :title => '评论')
      end
    end
  end

  private

  def show_blog_detail_about_tag blog
    contents_tag :div, :class => :infor_tag do |contents|
      blog.cached_tags.each do |tag|
        contents << link_to("<span>#{tag}</span>".html_safe, 
                            url(:blog, :tag, :name => tag), 
                            :class => 'tag', :rel => 'tag')
      end
    end
  end

  def blog_management(blog)
    return unless account_admin?
    contents = []
    contents << link_to('', url(:admin, :blog, :id => blog.id), :method => :delete, :confirm => '你要删除这篇文章吗？', :class => 'del', :title => '删除')
    contents << link_to('', url(:admin, :edit_blog, :id => blog.id), :class => 'edit', :title => '编辑')
  end
end