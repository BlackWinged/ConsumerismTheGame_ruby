class BetAnal < ApplicationRecord

  def getHour
    return self[:measuredTime].strftime('%H')
  end
  def getDateAndHour
    return self[:measuredTime].strftime('%H %M %d')
  end
end
