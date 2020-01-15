class AddCardFrontAndBackToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :card_front_address, :string
    add_column :players, :card_back_address, :string
  end
end
