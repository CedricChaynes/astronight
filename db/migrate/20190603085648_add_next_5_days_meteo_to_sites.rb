class AddNext5DaysMeteoToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :next_5_days_meteo, :jsonb
  end
end
