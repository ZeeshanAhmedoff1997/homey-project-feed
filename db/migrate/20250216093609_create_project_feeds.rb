class CreateProjectFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :project_feeds do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.string :feed_type

      t.timestamps
    end
  end
end
