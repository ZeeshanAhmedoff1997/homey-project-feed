class ProjectFeed < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :message, presence: true

  after_create_commit -> {
    broadcast_prepend_to "project_#{project_id}_feeds",
      target: "project_feeds_#{project_id}",
      partial: "projects/project_feeds/feed",
      locals: { feed: self }
  }

end
