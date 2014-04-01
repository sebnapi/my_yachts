class YachtsController < ApplicationController
  before_action :set_yacht, only: [:show, :edit, :update, :destroy]

  # GET /yachts
  # GET /yachts.json
  def index
    if params[:search]
      @yachts = Yacht.search(params[:search]).paginate(:page => params[:page], :per_page => 4)
    else
      @yachts = Yacht.paginate(:page => params[:page], :per_page => 4)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /yachts/1
  # GET /yachts/1.json
  def show
  end

  # GET /yachts/new
  def new
    @yacht = Yacht.new
  end

  # GET /yachts/1/edit
  def edit
  end

  # POST /yachts
  # POST /yachts.json
  def create
    @yacht = Yacht.new(yacht_params)

    respond_to do |format|
      if @yacht.save
        format.html { redirect_to @yacht, notice: 'Yacht was successfully created.' }
        format.json { render action: 'show', status: :created, location: @yacht }
      else
        format.html { render action: 'new' }
        format.json { render json: @yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yachts/1
  # PATCH/PUT /yachts/1.json
  def update
    respond_to do |format|
      if @yacht.update(yacht_params)
        format.html { redirect_to @yacht, notice: 'Yacht was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @yacht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yachts/1
  # DELETE /yachts/1.json
  def destroy
    @yacht.destroy
    respond_to do |format|
      format.html { redirect_to yachts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yacht
      @yacht = Yacht.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yacht_params
      params.require(:yacht).permit(:name, :length_m, :length_f, :manufacture_year, :country, :builder, :description, :picture)
    end
end
