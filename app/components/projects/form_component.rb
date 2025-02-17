module Projects
  class FormComponent < ViewComponent::Base
    def initialize(project:)
      @project = project
      @statuses = ProjectStateMachine.states
      @users = User.all
    end
  end
end
