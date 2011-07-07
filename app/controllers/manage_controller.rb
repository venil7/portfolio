class ManageController < ApplicationController
  before_filter :login_chek, :except => [:login, :login_submit, :logout]
  layout "manage"

  def index
    redirect_to :action => :projects
  end

  #projects
  def projects
    @page = params[:page] || 0
    @projects = Project.page(@page).per(page_size)
  end

  def add_project
    @project = Project.new
  end

  def create_project
    @project = Project.new(params[:project])
    _try_save_model @project, :add_project, :projects
  end

  def edit_project
    @project = Project.find(params[:id])
  end

  def update_project
    @project = Project.find(params[:id])
    @project.attributes= params[:project]
    _try_save_model @project, :edit_project, :projects
  end


  def delete_project
    Project.delete(params[:id])
    redirect_to :action => :projects
  end

  #blog
  def posts
      @page = params[:page] || 0
      @posts = Post.page(@page).per(page_size)
  end

  def add_post
    @post = Post.new
  end

  def create_post
    @post = Post.new(params[:post])
    _try_save_model @post, :add_post, :posts
  end

  def edit_post
    @post = Post.find(params[:id])
  end

  def update_post
    @post = Post.find(params[:id])
    @post.attributes=params[:post]
    _try_save_model @post, :edit_post, :posts
  end

  def delete_post
    Post.delete(params[:id])
    redirect_to :action => :posts
  end

  #enquiries
  def enquiries
    @page = params[:page] || 0
    @enquiries = Enquiry.page(@page).per(page_size)
  end

  def enquiry
    @enquiry = Enquiry.find(params[:id])
    if not @enquiry.read
      @enquiry.read = true
      @enquiry.save!
    end
  end

  def delete_enquiry
    Enquiry.delete(params[:id])
    redirect_to :action => :enquiries
  end

  #login
  def login
  end

  def login_submit
    if params[:login] == APP_CONFIG['admin_login'] and params[:password] == APP_CONFIG['admin_pass']
      _login
      #flash[:notice] = "success"
    end
    redirect_to :action => :index
  end

  def logout
    _logout
    #flash[:notice] = "bye bye"
    redirect_to :action => :index
  end

  def _logged_in?
    session[:logged_in]
  end

  private

#  def _try_save_model(project,source_action,redirect_action)
#    if project.save
#      flash[:notice] = "success"
#      redirect_to :action => redirect_action
#    else
#      flash[:notice] = "errors"
#      render source_action
#    end
#  end

  def _login
    session[:logged_in] = true
  end

  def _logout
    session[:logged_in] = false
  end

  def login_chek
    if not _logged_in?
      redirect_to :action => :login
    end
  end
end
