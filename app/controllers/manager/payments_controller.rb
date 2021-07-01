module Manager
class PaymentsController < ApplicationController
  before_action :set_client

    def new
      @payment = @client.payments.new
    end

    def show; end

    def edit; end

    def create
      @payment = Payment.new payment_params
      if @payment.save
        redircet_to manager_client_project_payment_path, notice: 'Payment is create for current project'
      else
        render :new
      end
    end

    private

    def set_client
      @client = Client.find(params[:client_id])
      @client = @client.projects.find(params[:project_id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :bank_name)
    end
    
  end
end
