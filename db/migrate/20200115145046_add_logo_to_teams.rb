class AddLogoToTeams < ActiveRecord::Migration
  def change
    #adds a internal address for logos
     add_column :teams, :logo_address, :string
  end
end
