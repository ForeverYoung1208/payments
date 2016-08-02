class AAccountsController < ApplicationController
  before_action :set_a_account, only: [:show, :edit, :update, :destroy]

  # GET /a_accounts
  # GET /a_accounts.json
  def index
    @a_accounts = AAccount.all
  end

  # GET /a_accounts/1
  # GET /a_accounts/1.json
  def show
  end

  # GET /a_accounts/new
  def new
    @a_account = AAccount.new
  end

  # GET /a_accounts/1/edit
  def edit
  end

  # POST /a_accounts
  # POST /a_accounts.json
  def create
    @a_account = AAccount.new(a_account_params)

    respond_to do |format|
      if @a_account.save
        format.html { redirect_to @a_account, notice: 'AAccount was successfully created.' }
        format.json { render :show, status: :created, location: @a_account }
      else
        format.html { render :new }
        format.json { render json: @a_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a_accounts/1
  # PATCH/PUT /a_accounts/1.json
  def update
    respond_to do |format|
      if @a_account.update(a_account_params)
        format.html { redirect_to @a_account, notice: 'AAccount was successfully updated.' }
        format.json { render :show, status: :ok, location: @a_account }
      else
        format.html { render :edit }
        format.json { render json: @a_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a_accounts/1
  # DELETE /a_accounts/1.json
  def destroy
    @a_account.destroy
    respond_to do |format|
      format.html { redirect_to a_accounts_url, notice: 'AAccount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a_account
      @a_account = AAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a_account_params
      params.require(:a_account).permit(:number, :company_name, :code)
    end
end
