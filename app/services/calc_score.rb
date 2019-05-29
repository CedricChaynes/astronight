class CalcScore
  def initialize(site, date)
    @site = site
    @date = date
  end

  def call
    # TO DO algorithmie de calcul du score
    rand(0..10)
  end

  def self.call(site, date)
    new(site, date).call
  end
end
