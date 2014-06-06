# encoding: utf-8

AndySite.helpers do
  
  def current_page_notice
    return unless flash[:notice]
    content_tag :div, flash[:notice], :id => "flash-notice"
  end

  def current_page_title title
    content_tag :title do
      title ? "#{title} - #{APP_CONFIG['site_title']}".html_safe : APP_CONFIG['site_title']
    end
  end

  def current_page_header
    content_tag :div, :class => :header do
      contents_tag :div, :class => :wrap do |contents|
        contents << current_page_header_about_user_img
        contents << content_tag(:div, APP_CONFIG['site_title'], :class => :blog_title)
        contents << current_page_header_about_manager
        contents << content_tag(:div, APP_CONFIG['site_motto'], :class => :blog_motto)
      end
    end
  end

  def current_page_nav
    content_tag :div, :class => :nav do
      contents_tag :div, :class => 'wrap clearfix' do |contents|
        contents << current_page_nav_about_navigation
        #contents << current_page_nav_about_search_form
      end
    end
  end

  def common_field form, attr, type=:text_field, br_count=1
    contents_tag :div, :class => :common_wrap do |contents|
      contents << form.label(attr)
      contents << form.send(type, attr)
      br_count.times.each do |index|
        contents << content_tag(:br)
      end
    end
  end

  private

  def current_page_nav_about_search_form
    content_tag :div, :class => 'search fr' do
      contents_tag :form do |contents|
        contents << content_tag(:input, :type => :hidden, :name => :cx,  :value => APP_CONFIG['google_cse'])
        contents << content_tag(:input, :type => :hidden, :name => :cof, :value => 'FORID:10')
        contents << content_tag(:input, :type => :hidden, :name => :ie,  :value => 'UTF-8')
        contents << content_tag(:input)
        contents << content_tag(:button)
      end
    end
  end

  def current_page_nav_about_navigation
    contents_tag :ul do |contents|
      contents << content_tag(:li, link_to('首页', url('/')))
      contents << content_tag(:li, link_to('博客', url('/blog')))
      contents << content_tag(:li, link_to('笔记', url('/note')))
      contents << content_tag(:li, link_to('分类', url('/tag')))
      contents << content_tag(:li, link_to('时光机', url('/me'), :target => '_blank'))
    end
  end

  def current_page_header_about_user_img
    content_tag :div, :class => 'user_img' do
      image_tag '/images/website.png', :class => :user_logo, :alt => 'website icon'
    end
  end

  def current_page_header_about_manager
    contents_tag :div, :class => :write do |contents|
      unless account_login?
        contents << link_to('登录', url(:login)) 
      else
        contents << current_account.name
        contents << link_to('写文章', url(:admin, :new_blog))
        contents << link_to('管理', url(:admin, :index), :class => 'admin')
        contents << link_to('退出', url(:logout), :method => :delete)
      end
    end
  end
end