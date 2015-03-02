class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :description

      t.timestamps
    end
  end
end
