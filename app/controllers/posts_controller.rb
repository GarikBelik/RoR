class PostsController < ApplicationController
  before_action :is_editor, except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
    @post = Posts.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = Posts.new
	end

	def edit
  end

	def create
    @post = Posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, success: 'Статья успешно создана' }
        format.json { render :show, status: :created, location: @post }
      else
       	format.html { render :new, danger: 'Статья не создана' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @post.change_counter += 1
      if @post.change_counter < 5
        if @post.update_attributes(post_params)
          format.html { redirect_to @post, success: 'Статья успешно обновлена' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, danger: 'Статья не обновлена' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @post, danger: 'Статья не обновлена, больше 5 редакций' }
      end
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to root_path, success: 'Статья успешно удалена'
    else
      render :edit, danger: 'Статья не удалена'
    end
  end

 	private

  def is_editor
    unless flash[:not_editor]
      unless (current_user && (current_user.admin || current_user.editor))
        redirect_to :root, not_editor: 'Недостаточно прав доступа'
      end
    end
  end

  def set_post
    @post = Posts.find(params[:id])
  end
  
  def post_params
    params.require(:posts).permit(:title, :body, :change_counter)
  end
end