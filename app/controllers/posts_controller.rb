class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", except: [:index]
  def index
    @posts = Post.order("created_at DESC")
  end

  def dashboard
    @post = Post.new
  end

  def create

    @post = Post.create(
      title: params[:post][:title],
      image_url: params[:post][:image_url],
      content: params[:post][:content]
    )

    if @post.valid?
      @post.save
      redirect_to root_path, notice: 'Post se creó correctamente.'
    else
      redirect_to root_path, notice: 'Post no se pudo crear'
    end
  end
end
