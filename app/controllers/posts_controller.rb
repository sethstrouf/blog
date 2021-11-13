class PostsController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.image.attach(params[:post][:image])

    if helpers.preview_admin
      flash[:alert] = "Can't post in Admin preview mode"
      redirect_to root_path
    else
      respond_to do |format|
        if @post.save
          format.html do
            redirect_to @post, notice: 'Post was successfully created.'
          end
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if helpers.preview_admin
      flash[:alert] = "Can't update in Admin preview mode"
      redirect_to root_path
    else
      respond_to do |format|
        if @post.update(post_params)
          format.html do
            redirect_to @post, notice: 'Post was successfully updated.'
          end
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if helpers.preview_admin
      flash[:alert] = "Can't delete  in Admin preview mode"
      redirect_to root_path
    else
      @post.destroy
      respond_to do |format|
        format.html do
          redirect_to posts_url, notice: 'Post was successfully destroyed.'
        end
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end
end
