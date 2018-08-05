module OffersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_offers_path
    elsif action_name == 'edit'
      offer_path
    end
  end
end
