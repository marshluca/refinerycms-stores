class AddSpreeFieldsToCustomUserTable < ActiveRecord::Migration
  def up
    add_column "refinery_users", :spree_api_key, :string, :limit => 48
    add_column "refinery_users", :ship_address_id, :integer
    add_column "refinery_users", :bill_address_id, :integer
  end

  def down
    remove_column "refinery_users", :spree_api_key
    remove_column "refinery_users", :ship_address_id
    remove_column "refinery_users", :bill_address_id
  end
end
