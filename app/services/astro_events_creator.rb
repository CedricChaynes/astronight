require 'csv'

class AstroEventsCreator
  def self.call
    csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
    filepath    = "#{Rails.root}/db/astroevents.csv"
    AstroEvent.destroy_all

    CSV.foreach(filepath, csv_options) do |row|
      AstroEvent.create!(
        date: Date.parse(row['Date']),
        title: row['Titre'],
        description: row['Description'],
        score: row['Note']
      )
      puts "#{row['Description']}, yeah"
    end
  end
end
