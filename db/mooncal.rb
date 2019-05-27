require 'lunartic'

moon = Lunartic.today
CSV.open('lunarcalendar.csv', 'w') do |csv|
  csv << %w[day month year]
  id = 1
  # max 587 sites
  while id < 200
    url = "#{baseurl}#{id}"
    response = open(url).read
    doc = Nokogiri::HTML(response)
    coords = doc.search('script').last.text.scan(/=-?\d+.?\d+?;/)
    coords.map! { |elem| elem.delete('=').delete(';') }
    csv << coords.unshift(id)
    id += 1
  end
end

