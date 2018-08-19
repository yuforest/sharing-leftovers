class LeftoversController < ApplicationController
  before_action :set_leftovers, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :new, :create, :edit,
  :update, :destroy, :confirm]
  def index
    @leftovers = Leftover.all
  end

  def show
    
  end

  def new
    if params[:back]
      @leftover = Leftover.new(leftover_params)
    else
      @leftover = Leftover.new
    end
  end

  def edit
  end

  def update
    if @leftover.update(leftover_params)
      flash[:success] = "オファーを編集しました！"
      redirect_to leftovers_path
    else
      render 'edit'
    end
  end

  def create
    @leftover = Leftover.new(leftover_params)
    @leftover.user_id = current_user.id
    if @leftover.save
      flash[:success] = "オファーを作成しました"
      redirect_to leftover_path(@leftover.id)
    else
      flash[:danger] = "オファーを作成できませんでした"
      render new_leftover_path
    end
  end

  def destroy
    @leftover.destroy
    flash[:danger] = "オファーを削除しました"
    redirect_to leftovers_path
  end
  
  def confirm
    @leftover = Leftover.new(leftover_params)
  end
  
  private
  def leftover_params
    params.require(:leftover).permit(:title, :content, :address, 
    :start_on, :end_on, :image, :image_cache, :category_id, :user_id)
  end
  
  def set_leftovers
    @leftover = Leftover.find(params[:id])
  end
  
end
