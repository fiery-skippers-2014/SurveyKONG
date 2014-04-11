class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table(:comment_votes) do |t|
      t.belongs_to :comment
      t.belongs_to :user
    end
  end
end
