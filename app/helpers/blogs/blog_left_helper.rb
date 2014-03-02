AndySite.helpers do
  def show_blog_header blog
    contents_tag :div, :class => "tit clearfix" do |contents|
      contents << blog_category_icon(blog)
      contents << link_to(blog.title, blog_url(blog))
      contents << blog_common_management(blog)
      
      contents.flatten!
    end
  end

  def show_blog_detail blog
    contents_tag :div, :class => "text" do |contents|
      contents << show_blog_detail_about_tag(blog)
      contents << blog.content.truncate(300)
    end
  end

  def show_tag_cloud
    content_tag :div, :class => "con" do
      content_tag :div, :class => 'tag_list' do
        contents_tag :ul, :class => "clearfix" do |contents|
          Blog.cached_tag_cloud.each do |tag|
            contents << contents_tag(:li)do|cs|
              cs << link_to("<span>#{tag.name}</span> ".html_safe, url(:blog, :tag, :name => tag.name), :class => 'tag')
              cs << " X "
              cs << content_tag(:span, tag.count)
            end
          end
          contents.flatten!
        end
      end
    end
  end

  private

  def show_blog_detail_about_tag blog
    contents_tag :div, :class => :infor_tag do |contents|
      blog.cached_tags.each do |tag|
        contents << link_to("<span>#{tag}</span>".html_safe, url(:blog, :tag, :name => tag), :class => 'tag', :rel => 'tag')
      end
    end
  end
end