class WelcomeController < ApplicationController
  before_filter :side_data

  #menu: home
  def home
    @menu_item = __method__
    @post = Post.last
  end

  #menu: services
  def services
    @menu_item = __method__
  end

  #menu: portfolio
  def portfolio
    @menu_item = __method__
    @page = params[:page] || 0
    @projects = Project.page(@page).per(page_size)
  end

  def project
    @menu_item = :portfolio
    @project = Project.find(params[:id])
  end

  #menu: blog
  def blog
    @menu_item = __method__
    @page = params[:page] || 0
    @posts = Post.page(@page).per(page_size)
  end

  def post
    @menu_item = :blog
    @post = Post.find(params[:id])
  end

  #menu: contact
  def contact
    @menu_item = __method__
    @enquiry = Enquiry.new
  end

  def create_enquiry
    @menu_item = :contact
    @enquiry = Enquiry.new(params[:enquiry])
    if _try_save_model(@enquiry, :contact, :contact,{:success => "Enquiry sent successfully"})
        UserMailer.submit_enquiry(@enquiry).deliver
    end
  end

  private

  def side_data
    @side_posts = Post.first(5)
    @side_projects = Project.first(5)
  end
end
