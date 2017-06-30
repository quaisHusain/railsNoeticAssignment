class UserPaymentsController < ApplicationController
  before_action :authenticate_user!, :set_user_payment, only: [:show, :edit, :update, :destroy]

  # GET /user_payments
  # GET /user_payments.json
  def index
    @user_payments = UserPayment.all
    @current_user = current_user

  end

  # GET /user_payments/1
  # GET /user_payments/1.json
  def show
  end

  # GET /user_payments/new
  def new
    @user_payment = UserPayment.new
  end

  # GET /user_payments/1/edit
  def edit
  end

  # POST /user_payments
  # POST /user_payments.json
  def create
    @user_payment = UserPayment.new(user_payment_params)

      @user_payment.payment_date = Time.now
      @user_payment.user_id = current_user.id;
    respond_to do |format|
      if @user_payment.save
        format.html { redirect_to @user_payment, notice: 'User payment was successfully created.' }
        format.json { render :show, status: :created, location: @user_payment }
      else
        format.html { render :new }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_payments/1
  # PATCH/PUT /user_payments/1.json
  def update
    respond_to do |format|
      if @user_payment.update(user_payment_params)
        format.html { redirect_to @user_payment, notice: 'User payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_payment }
      else
        format.html { render :edit }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_payments/1
  # DELETE /user_payments/1.json
  def destroy
    @user_payment.destroy
    respond_to do |format|
      format.html { redirect_to user_payments_url, notice: 'User payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_payment_params
      params.require(:user_payment).permit(:id, :amount, :stripe_token, :user_id, :payment_date, :datetime)
    end
end
