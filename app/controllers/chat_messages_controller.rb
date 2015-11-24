class ChatMessagesController < ApplicationController
  
  def index
    @chat_message = ChatMessage.new
  end

  def create
  	@chat_message = ChatMessage.new(params[:chat_message])
    @chat_message.name = current_user.email
  	Pusher.trigger('chat', 'new_message', {
      name: @chat_message.name,
      message: @chat_message.message }, 
      {
        socket_id: params[:socket_id]
      })

    respond_to :js
  end
end
