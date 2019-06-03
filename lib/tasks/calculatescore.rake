namespace :calcscore do
  desc "Crawl data"
  task sites: :environment do
    CalcScore.call
  end
end
