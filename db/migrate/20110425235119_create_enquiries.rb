class CreateEnquiries < ActiveRecord::Migration
  def self.up
    create_table :enquiries do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.string :text
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :enquiries
  end
end
