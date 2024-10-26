class AddCreatorRefToPostComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :post_comments, :user, null: false, foreign_key: true
  end
end
