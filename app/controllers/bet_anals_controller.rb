class BetAnalsController < ApplicationController
  #before_action :set_bet_anal, only: [:show, :edit, :update, :destroy]
  before_filter  :cors_preflight_check
  after_filter :cors_set_access_control_headers
  skip_before_action :verify_authenticity_token, only: [:betData, :cors_preflight_check]


  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = "1728000"

  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

  # GET /bet_anals
  # GET /bet_anals.json
  def index
    @bet_anals = BetAnal.all
  end

  # GET /bet_anals/1
  # GET /bet_anals/1.json
  def show
  end

  # GET /bet_anals/new
  def new
    @bet_anal = BetAnal.new
  end

  # GET /bet_anals/1/edit
  def edit
  end

  # POST /bet_anals
  # POST /bet_anals.json
  def create
    @bet_anal = BetAnal.new(bet_anal_params)

    respond_to do |format|
      if @bet_anal.save
        format.html { redirect_to @bet_anal, notice: 'Bet anal was successfully created.' }
        format.json { render :show, status: :created, location: @bet_anal }
      else
        format.html { render :new }
        format.json { render json: @bet_anal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_anals/1
  # PATCH/PUT /bet_anals/1.json
  def update
    respond_to do |format|
      if @bet_anal.update(bet_anal_params)
        format.html { redirect_to @bet_anal, notice: 'Bet anal was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_anal }
      else
        format.html { render :edit }
        format.json { render json: @bet_anal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_anals/1
  # DELETE /bet_anals/1.json
  def destroy
    @bet_anal.destroy
    respond_to do |format|
      format.html { redirect_to bet_anals_url, notice: 'Bet anal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def betData
    test = params.keys

    if test == 3
      return
    end

  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_bet_anal
  #     @bet_anal = BetAnal.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def bet_anal_params
  #     params.require(:bet_anal).permit(:undrawnCycleCount, :undrawnBallCount, :measuredTime)
  #   end


end
