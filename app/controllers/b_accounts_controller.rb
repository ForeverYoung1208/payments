class BAccountsController < ApplicationController
  before_action :set_b_account, only: [:show, :edit, :update, :destroy]

  # GET /b_accounts
  # GET /b_accounts.json
  def index
    @b_accounts = BAccount.all
  end

  # GET /b_accounts/1
  # GET /b_accounts/1.json
  def show
  end

  # GET /b_accounts/new
  def new
    @b_account = BAccount.new
  end

  # GET /b_accounts/1/edit
  def edit
  end

  # POST /b_accounts
  # POST /b_accounts.json
  def create
    @b_account = BAccount.new(b_account_params)

    respond_to do |format|
      if @b_account.save
        format.html { redirect_to @b_account, notice: 'B account was successfully created.' }
        format.json { render :show, status: :created, location: @b_account }
      else
        format.html { render :new }
        format.json { render json: @b_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b_accounts/1
  # PATCH/PUT /b_accounts/1.json
  def update
    respond_to do |format|
      if @b_account.update(b_account_params)
        format.html { redirect_to @b_account, notice: 'B account was successfully updated.' }
        format.json { render :show, status: :ok, location: @b_account }
      else
        format.html { render :edit }
        format.json { render json: @b_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b_accounts/1
  # DELETE /b_accounts/1.json
  def destroy
    @b_account.destroy
    respond_to do |format|
      format.html { redirect_to b_accounts_url, notice: 'B account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b_account
      @b_account = BAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b_account_params
      params.require(:b_account).permit(:number, :name, :plan, :fact)
    end
end
