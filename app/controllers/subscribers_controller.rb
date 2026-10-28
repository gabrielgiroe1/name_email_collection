class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    @subscriber.valid?

    if @subscriber.email.present? && Subscriber.exists?(email: @subscriber.email)
      return redirect_to thank_you_path, status: :see_other
    end

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
