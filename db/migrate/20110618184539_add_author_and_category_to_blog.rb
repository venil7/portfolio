class AddAuthorAndCategoryToBlog < ActiveRecord::Migration
  def self.up
    add_column :posts, :author, :string
    add_column :posts, :category, :string
  end

  def self.down
    remove_column :posts, :category
    remove_column :posts, :author
  end
end
