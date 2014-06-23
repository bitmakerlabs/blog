class AddArticleIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :article_id, :integer, index: true
  end
end
