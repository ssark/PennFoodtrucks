class FoodTruck < ActiveRecord::Base
  has_many :ratings, dependent: :destroy

  def open?
    t = Time.zone.now
    if open <= t.hour && t.hour < close
      true
    else
      false
    end
  end

  def convert(num)
    if num > 12
      (num - 12).to_s + 'pm'
    else
      num.to_s + 'am'
    end
  end
end
