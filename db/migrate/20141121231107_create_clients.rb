class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :address
      t.string :token
    end
  end
end
