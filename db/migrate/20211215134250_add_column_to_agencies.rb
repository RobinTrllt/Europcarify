class AddColumnToAgencies < ActiveRecord::Migration[6.0]
  def change
    add_column :agencies, :latitude, :float
    add_column :agencies, :longitude, :float
  end
end
