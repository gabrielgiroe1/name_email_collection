class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    email = subscriber_params[:email].to_s.strip.downcase
    if email.present? && Subscriber.find_by_email(email).present?
      return redirect_to thank_you_path
    end
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.email = email

    if @subscriber.save
      redirect_to thank_you_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    redirect_to thank_you_path, status: :see_other
  end

  def thank_you
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
