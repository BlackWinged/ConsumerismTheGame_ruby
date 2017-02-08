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
  
  # def index
  #   @bet_anals = BetAnal.all
  #   @parsed_anals = {}
  #   @siteNames = []
  #   @bet_anals.map do |f|
  #     @siteNames.push(f.nameOfLoto)
  #     if !@parsed_anals.key?(f.getDateAndHour)
  #       @parsed_anals[f.getDateAndHour] = []
  #     end
  #     @parsed_anals[f.getDateAndHour].push(f)
  #   end
  #   count = 1
  #   @parsed_anals.keys.map do |f|
  #     @parsed_anals[f].map do |g|
  #       g.group = count
  #       g.save
  #     end
  #     count += 1
  #   end
  #   max = 0
  #   @parsed_anals.keys.each do |key|
  #     if max < @parsed_anals[key].count
  #       max = @parsed_anals[key].count
  #     end
  #   end
  #   @siteNames.uniq!
  #   @maxRecords = max
  # end
  
  def index
      if params[:nameOfLoto] != nil and !params[:nameOfLoto].empty?
        fromDate = Time.now - 1.days
        uptoDate = Time.now + 1.days
        if !params[:from_date].empty?
          fromDate = DateTime.strptime( params[:from_date], '%Y-%m-%d') - 1.days
        end
        if !params[:to_date].empty?
          uptoDate = DateTime.strptime( params[:to_date], '%Y-%m-%d') + 1.days
        end

        @bet_anals = BetAnal.where(nameOfLoto: params[:nameOfLoto]).where('bet_anals."measuredTime" >= ? and bet_anals."measuredTime" <= ?', fromDate, uptoDate)
      else
        @bet_anals = BetAnal.all
      end


    @parsed_anals = {}
    @siteNames = []
    @orderedGroups = []
    @maxCycles = 0
    @bet_anals.each do |f|
      @maxCycles = [@maxCycles, f.undrawnCycleCount].max()
       @orderedGroups.push(f.group)
       @siteNames.push(f.nameOfLoto)
      if !@parsed_anals.key?(f.group)
        @parsed_anals[f.group] = {}
      end
      @parsed_anals[f.group][f.undrawnCycleCount] = f
     end
    max = 0
    @parsed_anals.keys.each do |key|
      if max < @parsed_anals[key].count
        max = @parsed_anals[key].count
      end
    end
    @siteNames.uniq!
    @orderedGroups.uniq!
    @orderedGroups.sort!
    @maxRecords = max
      @victoryHash = {}
      if params[:bet_on_number] != nil and !params[:bet_on_number].empty?
        @victoryHash  = processProfits(@parsed_anals, params[:bet_on_number].to_i , @maxCycles, @orderedGroups)
      end
    end

  def processProfits(parsed_anals, numberToCheck, maxCycles, orderedGroups)
    dataSets = []

    for numCheck in numberToCheck..maxCycles
      nextSet = []
      orderedGroups.each do |key|
        if parsed_anals[key].key?(numCheck)
          nextSet.push(parsed_anals[key][numCheck].undrawnBallCount)
        else
          nextSet.push(0)
        end
      end
      dataSets.push(nextSet)
    end

    wins = 0
    loses = 0
      for i in 1..orderedGroups.count - 1
        deltaFirst = dataSets[0][i-1] - dataSets[1][i]
        wins += deltaFirst
        loses += dataSets[1][i]
      end
    return victoryHash = {:wins => wins, :loses => loses}
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
    data = JSON.parse(request.raw_post)
    buffer = data["bettingData"]
    numbers = buffer["numbers"]

    lastMod = BetAnal.where(nameOfLoto: buffer['nameOfSite']).last()
    groupNum = BetAnal.last.group
    numbers.keys.each do |f|
      model = BetAnal.new(:undrawnBallCount => numbers[f], :undrawnCycleCount => f, :measuredTime => Time.now, :nameOfLoto => buffer['nameOfSite'], :refererUrl => request.referer, :group => groupNum + 1)
      if lastMod != nil
        if TimeDifference.between(model.measuredTime, lastMod.measuredTime).in_minutes < (buffer["interval"].to_i() - 1)
          return
        end
      end
      model.save
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
