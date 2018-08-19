class OffersController < ActionController::Base
  def create
    @offer = Offer.new(user_id: params[:user_id], leftover_id: params[:leftover_id])
    if @offer.save
      redirect_to leftovers_path
    else
      flash[:notice] = "申請ができませんでした"
      redirect_to leftovers_path
    end
  end
  
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to leftovers_path
  end
end