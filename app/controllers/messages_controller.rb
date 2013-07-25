class MessagesController < ApplicationController
  load_and_authorize_resource

  def index
    @messages = Message.order("created_at desc").page(params[:page])
  end

  def show
  end

  def new
    @message = Message.new
  end
  
  def create 
    @message = Message.new(params[:message])
    if @message.save
      if MessageMailer.send_message(@message).deliver
        flash[:notice] = "Thank you for your question or comment. We will be in touch soon."
        redirect_to root_url
      else
        flash[:notice] = "Sorry, message could not be sent."
      end
    else
      render 'new'
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, :notice => "Successfully destroyed message."
  end
end