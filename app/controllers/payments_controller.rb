class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @transaction = Payment.where(category_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    @transaction = Payment.new
  end

  def show
    @transaction = Payment.find(params[:id])
  end

  def create
    @user = current_user
    @transaction = @user.payments.new(transaction_params)
    if @transaction.save
      flash[:notice] = 'Transaction sucessfully created!'
      redirect_to user_category_payments_path(@user)
    else
      flash[:alert] = 'Transaction could not be be created!'
      render :new
    end
  end

  private

  def transaction_params
    params.require(:payment).permit(:name, :amount, :category_id, :user_id)
  end
end
