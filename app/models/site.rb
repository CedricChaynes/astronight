class Site < ApplicationRecord
  has_many :events, dependent: :destroy
  geocoded_by :address, latitude: :lat, longitude: :lng
  before_create :geocode, if: :need_geocode?

  def score(date)
    # TODO
  end

  def photo
    read_attribute(:photo) || ActionController::Base.helpers.asset_path("pre.png")
  end

  def need_geocode?
    lat.nil? || lng.nil?
  end
end
