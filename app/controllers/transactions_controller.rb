class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :edit_status, :update_status]
  before_action :edit_allowed, only: [:edit, :update]
  before_action :authenticate_admin, only: [:edit_status, :update_status]
  before_action :authenticate_user!
  before_action :ensure_org_setup
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  def edit_status

  end

  def update_status
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, :flash => { success: 'Transaction was successfully updated.'} }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /transactions
  # POST /transactions.json
  def create

    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, :flash => { success: 'Transaction was successfully created.'} }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, :flash => { success: 'Transaction was successfully updated.'} }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
  def authenticate_admin

  end
  def edit_allowed
    set_transaction
    if @transaction.editable == false
      redirect_to '/', :flash => { danger: 'You can no longer edit this transaction.'}
    end
  end
  def ensure_org_setup
    if !current_user.organization
      redirect_to '/setup', error: 'You must setup your organization first.'
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:date, :department, :amount, :currency, :covered, :description, :transaction_status)
  end
end
