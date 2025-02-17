module Projects
  class MembersComponent < ViewComponent::Base
    def initialize(project:, current_user:)
      @project = project
      @current_user = current_user
    end
  end
end
