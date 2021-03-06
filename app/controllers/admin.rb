# encoding: utf-8

AndySite.controllers :admin do
  
  before do
    halt 403 unless account_admin?
  end
  
  get :index do
    render 'admin/index'
  end

  # blog related routes: publish, update, delete blog and blog content editor preview...
  get :new_blog, :map => '/admin/blog/new' do
    @blog = Blog.new
    @blog.category = 'blog'
    @attachments = current_account.attachments.orphan
    render 'admin/blog', :layout => :common
  end
  
  post :blog, :map => '/admin/blog' do
    @blog = Blog.new(params[:blog])
    @blog.account = current_account
    if @blog.save
      @blog.attach!(current_account)
      ping_search_engine(@blog) if APP_CONFIG['blog_search_ping'] # only ping search engine in production environment
      flash[:notice] = '文章成功发布'
      redirect url(:blog, :show, :id => @blog.id)
    else
      render 'admin/blog'
    end
  end

  post :blog_preview, :map => '/admin/blog/preview' do
    GitHub::Markdown.to_html(params[:term], :gfm) if params[:term]
  end
  
  get :edit_blog, :map => '/admin/blog/:id/edit' do
    @blog = Blog.find params[:id].to_i
    @attachments = current_account.attachments.where(:blog_id => [nil, @blog.id]).order('id ASC')
    render 'admin/blog', :layout => :common
  end
  
  put :blog, :map => '/admin/blog/:id' do
    @blog = Blog.find params[:id].to_i
    if @blog.update_blog(params[:blog])
      @blog.attach!(current_account)
      flash[:notice] = '文章修改完成'
      redirect url(:blog, :show, :id => @blog.id)
    else
      render 'admin/blog'
    end
  end
  
  delete :blog, :map => '/admin/blog/:id' do
    @blog = Blog.find params[:id].to_i
    @blog.destroy
    flash[:notice] = '文章已经删除'
    redirect url(:index)
  end


  # attachment related routes: upload, show, delete attachment...
  get :new_attachment, :map => '/admin/attachment/new' do
    @attachment = Attachment.new
    render 'admin/new_attachment', :layout => false
  end
  
  get :attachment, :map => '/admin/attachment/:id' do
    @attachment = Attachment.find params[:id]
    render 'admin/attachment', :layout => false
  end
  
  post :create_attachment, :map => '/admin/attachment' do
    attachment = Attachment.new(params[:attachment])
    attachment.account = current_account
    if attachment.save
      redirect_to url(:admin, :attachment, :id => attachment.id)
    else
      render 'admin/attachment_fail', :layout => false
    end
  end
  
  delete :attachment, :map => '/admin/attachment/:id' do
    content_type :js
    @attachment = Attachment.find params[:id]
    @attachment.destroy
    "$('#attachment_#{@attachment.id}').html('<del> #{@attachment.file} 附件已被删除</del>')"
  end
  
  # admin console related: profile, accounts, blogs, comments...
  get :edit_profile, :map => '/admin/profile/:id/edit' do
    @account = Account.find params[:id]
    if @account.admin?
      render 'admin/edit_profile'
    else
      redirect_to url(:admin, :accounts)
    end
  end
  
  put :profile, :map => '/admin/profile/:id' do
    @account = Account.find params[:id]
    if @account.update_attributes(params[:account])
      flash[:notice] = '修改个人设置成功'
      redirect_to url(:admin, :edit_profile, :id => @account.id)
    else
      render 'admin/edit_profile'
    end
  end
  
  get :accounts, :map => '/admin/accounts' do
    @admin_accounts = Account.where(:role => 'admin').order('id ASC')
    @commenters = Account.where(:role => 'commenter').order('id DESC').page(params[:page]).per_page(100)
    render 'admin/accounts'
  end
  
  delete :account, :map => '/admin/account/:id' do
    content_type :js
    account = Account.find params[:id]
    if account.commenter?
      account.destroy
      "$('tr#account_#{account.id}').fadeOut('slow', function(){ $(this).remove();});"
    end
  end
  
  get :blogs, :map => '/admin/blogs' do
    @blogs = Blog.order('id DESC').page(params[:page]).per_page(100)
    render 'admin/blogs'
  end
  
  get :comments, :map => '/admin/comments' do
    @comments = BlogComment.order('id DESC').page(params[:page]).per_page(100)
    render 'admin/comments'
  end

  get :backup, :map => '/admin/backup' do
    @backup = AdminBackup.backup_list
    render 'admin/backup'
  end

  post :backup, :map => '/admin/backup' do
    @backup = AdminBackup.backup
    render 'admin/backup'
  end

  get :time_axes, :map => '/admin/time_axes' do
    @axes = TimeAxis.all
    render 'admin/time_axes'
  end

  get :add_axis, :map => '/admin/add_axis' do
    @axis = TimeAxis.new
    render 'admin/axis'
  end

  post :axis, :map => '/admin/axis' do
    TimeAxis.create(params[:time_axis])
    redirect_to url(:admin, :time_axes)
  end

  get :edit_axis, :map => '/admin/edit_axis' do
    @axis = TimeAxis.find params[:id]
    render 'admin/axis'
  end

  put :axis, :map => '/admin/axis/:id' do
    TimeAxis.find(params[:id]).update_attributes(params[:time_axis])
    redirect_to url(:admin, :time_axes)
  end

  delete :delete_axis, :map => "/admin/delete_axis" do
    TimeAxis.delete params[:id]
    redirect_to url(:admin, :time_axes)
  end
end
