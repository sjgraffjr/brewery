class BrewersController < ApplicationController
  before_action :set_brewer, only: [:show, :edit, :update, :destroy]

  # GET /brewers
  # GET /brewers.json
  def index
    @brewers = Brewer.all.limit(1000)
  end

  # GET /brewers/1
  # GET /brewers/1.json
  def show
  end

  # GET /brewers/new
  def new
    @brewer = Brewer.new
  end

  # GET /brewers/1/edit
  def edit
  end

  # POST /brewers
  # POST /brewers.json
  def create
    @brewer = Brewer.new(brewer_params)

    respond_to do |format|
      if @brewer.save
        format.html { redirect_to @brewer, notice: 'Brewer was successfully created.' }
        format.json { render :show, status: :created, location: @brewer }
      else
        format.html { render :new }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brewers/1
  # PATCH/PUT /brewers/1.json
  def update
    respond_to do |format|
      if @brewer.update(brewer_params)
        format.html { redirect_to @brewer, notice: 'Brewer was successfully updated.' }
        format.json { render :show, status: :ok, location: @brewer }
      else
        format.html { render :edit }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brewers/1
  # DELETE /brewers/1.json
  def destroy
    @brewer.destroy
    respond_to do |format|
      format.html { redirect_to brewers_url, notice: 'Brewer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewer
      @brewer = Brewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewer_params
      params.require(:brewer).permit(:name, :is_organic, :website, :status, :ext_id, :description, :status_display)
    end
end
