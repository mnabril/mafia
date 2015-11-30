class ChatMessagesController < ApplicationController
  
  def index
    @chat_message = ChatMessage.new
  end

  def show
    @chat_message = ChatMessage.new
  end

  def create
  	@chat_message = ChatMessage.new(params[:chat_message])
    @chat_message.name = current_user.email
    channel = params[:channel]
    Pusher.trigger(channel, 'new_message', {
      name: @chat_message.name,
      message: @chat_message.message }, 
      {
        socket_id: params[:socket_id], 
      })

    respond_to :js
  end

  def trigger(channel)
    # # channel << params[:id]
    # Pusher.trigger(channel, 'new_message', {
    #   name: @chat_message.name,
    #   message: @chat_message.message }, 
    #   {
    #     socket_id: params[:socket_id],
    #     id: params[:id]
    #   })

    # respond_to :js
  end
end

###################
# what i did
# able to make multiple chat channels based on id
# need to figure out
# trigger to the game room specific chat channel
