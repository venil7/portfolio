class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :short
      t.string :long
      t.string :url
      t.string :company

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
