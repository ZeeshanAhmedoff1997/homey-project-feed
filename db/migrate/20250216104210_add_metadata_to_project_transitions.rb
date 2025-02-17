class AddMetadataToProjectTransitions < ActiveRecord::Migration[8.0]
  def change
    add_column :project_transitions, :metadata, :jsonb, default: {}
  end
end
