class BetAnal < ApplicationRecord

  def getHour
    return self[:measuredTime].strftime('%H')
  end

end
