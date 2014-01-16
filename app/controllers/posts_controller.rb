class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new( params[:post]) #post_params )

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

#    @post = Post.new(params[:post])

#    @post.save
#    redirect_to @post

#    render text: params[:post].inspect

  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

#    if @post.update(post_params)
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render 'edit'
    end

#      @post = Post.find_by_id(params[:id])
#      if @post.update_attributes(params[:post])
#        redirect_to @post
#      else
#        render action: :edit
#      end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

 #  private
#  def post_params
#    params.require(:post).permit(:title, :text)
#  end
end
