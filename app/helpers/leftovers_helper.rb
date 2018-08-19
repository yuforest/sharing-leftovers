module LeftoversHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_leftovers_path
    elsif action_name == 'edit'
      leftover_path
    end
  end
end
