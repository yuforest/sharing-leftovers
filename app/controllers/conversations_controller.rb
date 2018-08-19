class ConversationsController < ApplicationController
  before_action :authenticate_user
  def create
    if Conversation.find_by(sender_id: params[:sender_id],
      recipient_id: params[:recipient_id],
      leftover_id: params[:leftover_id]).present?
      
      @conversation = Conversation.find_by(sender_id: params[:sender_id],
      recipient_id: params[:recipient_id],
      leftover_id: params[:leftover_id])
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end
  private

  def conversation_params
    params.permit(:sender_id, :recipient_id, :leftover_id)
  end
end
