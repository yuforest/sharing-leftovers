class OffersController < ApplicationController
  before_action :set_offers, only: [:show, :edit, :update, :destroy]
  def index
    @offers = Offer.all
  end

  def show
    
  end

  def new
    if params[:back]
      @offer = Offer.new(feed_params)
    else
      @offer = Offer.new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      flash[:notice] = "オファーを編集しました！"
      redirect_to offers_path
    else
      render 'edit'
    end
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = User.first.id
    if @offer.save
      flash[:notice] = "オファーを作成しました"
      redirect_to offer_path(@offer.id)
    else
      flash[:notice] = "オファーを作成できませんでした"
      render new_offer_path
    end
  end

  def destroy
    @offer.destroy
    flash[:notice] = "オファーを削除しました"
    redirect_to offers_path
  end
  
  def confirm
    @offer = Offer.new(offer_params)
  end
  
  private
  def offer_params
    params.require(:offer).permit(:title, :content, :address, :start, :end, :image, :image_cache)
  end
  
  def set_offers
    @offer = Offer.find(params[:id])
  end
  
end
