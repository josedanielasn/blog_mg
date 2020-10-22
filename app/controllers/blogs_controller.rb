class BlogsController < ApplicationController
  before_action :find_blog, except: %i[show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog  = @user.blogs.build()
  end

  def create
    @blog = @user.blogs.build(blog_params)
    if @blog.save 
      redirect_to show_user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments
  end

  def edit
    
  end

  def update
    if @blog.update(blog_params)
      redirect_to show_blog_path(@blog)
    else
      render 'edit'
    end
  end

  def delete
    @blog.destroy
    redirect_to show_user_path(@user)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content_text)
  end

end
