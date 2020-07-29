# frozen_string_literal: true

namespace :calcscore do
  desc "Calculate score"
  task sites: :environment do
    p "List of scores:"
    Site.all.each_with_index do |site, index|
      p "#{index + 1} - ID: #{site.id}/ #{site.address}:"
      p "#{site.id}/ #{site.address}: #{CalcScore.call(site, Time.zone.today)}"
      p "-" * 100
    end
  end
end
