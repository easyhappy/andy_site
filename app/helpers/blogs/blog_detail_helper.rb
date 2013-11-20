AndySite.helpers do
  def show_detail_page_about_blog_header blog
    contents_tag :div, :class => "tit clearfix" do |contents|
      contents << blog_category_icon(@blog)
      contents << link_to(@blog.title, blog_url(@blog))
      contents << blog_common_management(blog)
    end
  end

  def show_detail_page_about_blog_tag blog
    return if blog.cached_tags.blank?
    contents_tag :div, :class => "info clearfix" do |contents|
      blog.cached_tags.each do |tag|
        contents << link_to("<span>#{tag}</span>".html_safe, url(:blog, :tag, :name => tag), :class => 'tag', :rel => 'tag')
      end
    end
  end

  def show_detail_page_about_blog_body blog
    content_tag :div, :class => :text do
      blog.md_content.html_safe
    end
  end

  def show_share_to_weibo blog
    share_content = (@blog.title + ":" + @blog.content).truncate(120).gsub(/\r|\n/, '')
    
    content_tag :div, :class => "share clearfix" do
      content_tag(:span, partial('blog/weibo_share', :locals => {:content => share_content}))
    end
  end
end