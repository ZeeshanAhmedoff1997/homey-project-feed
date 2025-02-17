class AddMostRecentToProjectTransitions < ActiveRecord::Migration[8.0]
  def change
    add_column :project_transitions, :most_recent, :boolean, null: false, default: false
  end
end
