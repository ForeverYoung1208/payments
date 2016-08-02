class ResourcersController < ApplicationController
  before_action :set_resourcer, only: [:show, :edit, :update, :destroy]

  # GET /resourcers
  # GET /resourcers.json
  def index
    @resourcers = Resourcer.all
  end

  # GET /resourcers/1
  # GET /resourcers/1.json
  def show
  end

  # GET /resourcers/new
  def new
    @resourcer = Resourcer.new
  end

  # GET /resourcers/1/edit
  def edit
  end

  # POST /resourcers
  # POST /resourcers.json
  def create
    @resourcer = Resourcer.new(resourcer_params)

    respond_to do |format|
      if @resourcer.save
        format.html { redirect_to @resourcer, notice: 'Resourcer was successfully created.' }
        format.json { render :show, status: :created, location: @resourcer }
      else
        format.html { render :new }
        format.json { render json: @resourcer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resourcers/1
  # PATCH/PUT /resourcers/1.json
  def update
    respond_to do |format|
      if @resourcer.update(resourcer_params)
        format.html { redirect_to @resourcer, notice: 'Resourcer was successfully updated.' }
        format.json { render :show, status: :ok, location: @resourcer }
      else
        format.html { render :edit }
        format.json { render json: @resourcer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resourcers/1
  # DELETE /resourcers/1.json
  def destroy
    @resourcer.destroy
    respond_to do |format|
      format.html { redirect_to resourcers_url, notice: 'Resourcer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resourcer
      @resourcer = Resourcer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resourcer_params
      params.require(:resourcer).permit(:name)
    end
end
