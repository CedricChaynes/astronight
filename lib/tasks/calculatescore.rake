namespace :calcscore do
  desc "Calculate score"
  task sites: :environment do
    p "List of scores:"
    Site.all.each_with_index do |site, index|
      p "#{index + 1} - ID: #{site.id}/ #{site.address}:"
      p "#{site.id}/ #{site.address}: #{CalcScore.call(site, Date.today)}"
      p "-" * 100

      # if [62, 94, 131, 143, 145, 157, 192, 244, 298, 465, 531, 544].include? site.id
      #   p "#{index + 1} - ID: #{site.id}/ #{site.address}:"
      #   p site.next_5_days_meteo
      #   p "-" * 100
      # end
    end
  end
end
