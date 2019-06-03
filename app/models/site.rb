class Site < ApplicationRecord
  has_many :events
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :will_save_change_to_address?

  def score(date)
    # TODO
  end

  def photo
    read_attribute(:photo) || ActionController::Base.helpers.asset_path("pre.png")
  end
end
