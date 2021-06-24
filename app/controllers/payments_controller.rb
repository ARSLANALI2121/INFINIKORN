class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def show
  end

  def edit
  end
end
