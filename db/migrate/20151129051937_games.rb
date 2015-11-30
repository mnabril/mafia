class Games < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.integer :game_id
  	end
  end
end
