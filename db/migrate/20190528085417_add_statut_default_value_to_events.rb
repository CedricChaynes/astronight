class AddStatutDefaultValueToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :status, :string, default: 'pending'
  end
end
