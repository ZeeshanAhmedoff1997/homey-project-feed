class ProjectStateMachine
  include Statesman::Machine

  state :new, initial: true
  state :in_progress
  state :completed
  state :on_hold
  state :canceled

  transition from: :new, to: [:in_progress, :canceled]
  transition from: :in_progress, to: [:completed, :on_hold]
  transition from: :completed, to: [:in_progress]
  transition from: :on_hold, to: [:in_progress, :canceled]

  after_transition do |project, transition|
    project.project_feeds.create!(
      user: project.user,
      message: "Status changed from #{transition.from_state} to #{transition.to_state}",
      feed_type: "status_update"
    )
  end
end
