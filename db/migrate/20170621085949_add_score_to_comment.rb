class AddScoreToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :score, :integer
  end
end
