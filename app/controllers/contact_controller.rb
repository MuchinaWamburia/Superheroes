class ContactController < ApplicationController
  def index
    if request.post?
      name = params[:name]
      email = params[:email]
      message = params[:message]
      
      # code to send email or save message to database goes here
      
      flash[:success] = "Thanks for contacting us!"
      redirect_to contact_path
      render :index
    end
  end

  def create
    # Get the form data from the params hash
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Send an email using ActionMailer
    ContactMailer.contact_email(name, email, message).deliver_now

    # Redirect the user to a confirmation page
    redirect_to contact_path, notice: 'Thank you for your message!'
end
end