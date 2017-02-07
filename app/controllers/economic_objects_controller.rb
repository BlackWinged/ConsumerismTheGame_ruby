class EconomicObjectsController < ApplicationController
  before_action :set_economic_object, only: [:show, :edit, :update, :destroy]

  # GET /economic_objects
  # GET /economic_objects.json
  def index
    @economic_objects = EconomicObject.all
  end

  # GET /economic_objects/1
  # GET /economic_objects/1.json
  def show
  end

  # GET /economic_objects/new
  def new
    @economic_object = EconomicObject.new
  end

  # GET /economic_objects/1/edit
  def edit
  end

  # POST /economic_objects
  # POST /economic_objects.json
  def create
    @economic_object = EconomicObject.new(economic_object_params)

    respond_to do |format|
      if @economic_object.save
        format.html { redirect_to @economic_object, notice: 'Economic object was successfully created.' }
        format.json { render :show, status: :created, location: @economic_object }
      else
        format.html { render :new }
        format.json { render json: @economic_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economic_objects/1
  # PATCH/PUT /economic_objects/1.json
  def update
    respond_to do |format|
      if @economic_object.update(economic_object_params)
        format.html { redirect_to @economic_object, notice: 'Economic object was successfully updated.' }
        format.json { render :show, status: :ok, location: @economic_object }
      else
        format.html { render :edit }
        format.json { render json: @economic_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economic_objects/1
  # DELETE /economic_objects/1.json
  def destroy
    @economic_object.destroy
    respond_to do |format|
      format.html { redirect_to economic_objects_url, notice: 'Economic object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economic_object
      @economic_object = EconomicObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economic_object_params
      params.require(:economic_object).permit(:supply, :production, :costOfStorage, :funds, :type)
    end
end
