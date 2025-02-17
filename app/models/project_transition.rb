class ProjectTransition < ApplicationRecord

  validates :to_state, inclusion: { in: ProjectStateMachine.states }

  belongs_to :project, inverse_of: :project_transitions

  before_create :set_from_state
  after_destroy :update_most_recent, if: :most_recent?

  private

  def set_from_state
    last_transition = project.project_transitions.order(:sort_key).last
    self.from_state = last_transition&.to_state || "new"
  end


  def update_most_recent
    last_transition = apartment.apartment_transitions.order(:sort_key).last
    return if last_transition.blank?

    last_transition.update(most_recent: true)
  end
end
