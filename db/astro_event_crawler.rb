require 'open-uri'
require 'nokogiri'
require 'csv'

baseurl = 'http://www.seasky.org/astronomy/astronomy-calendar-'

CSV.open('astronomy-events.csv', 'w') do |csv|
  csv << %w[year date name description]
  year = 2019
  # max 587 sites
  while year < 2031
    url = "#{baseurl}#{year}.html"
    response = open(url).read
    doc = Nokogiri::HTML(response)
    doc.search('li p').each do |elem|
      date = elem.search('.date-text').text.strip.gsub(' & ', ', ')
      name = elem.search('.title-text').text.strip.chop
      description = elem.text.strip.split('. ').drop(1).join('. ')
                        .gsub('(NASA Map and Eclipse Information)', '')
                        .gsub('(NASA Interactive Google Map)', '')
                        .strip
      csv << [year, date, name, description]
    end
    year += 1
  end
end
