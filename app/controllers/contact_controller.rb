class ContactController < ApplicationController
    def new
    @message = Message.new()
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      
      render :new
      flash.alert = "Please fill all fields."
    end
  end
end
