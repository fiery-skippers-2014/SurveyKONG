class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table(:post_votes) do |t|
      t.belongs_to :post
      t.belongs_to :user
    end
  end
end
