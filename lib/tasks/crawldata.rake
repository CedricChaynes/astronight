namespace :crawl do
  desc "Crawl data"
  task sites: :environment do
    WeatherCrawler.call
  end
end
