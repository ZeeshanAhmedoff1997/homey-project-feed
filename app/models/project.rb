class Project < ApplicationRecord
  belongs_to :user
  has_many :project_feeds, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :project_transitions, dependent: :destroy, autosave: false

  validates :name, presence: true

  after_update_commit -> {
    broadcast_replace_to(
      self,
      target: "project_status",
      partial: "projects/status",
      locals: { project: self }
    )
  }

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: ProjectTransition,
    initial_state: :new
  ]

  def state_machine
    @state_machine ||= ProjectStateMachine.new(self, transition_class: ProjectTransition, association_name: :project_transitions)
  end

  def current_state
    state_machine.current_state
  end
end
