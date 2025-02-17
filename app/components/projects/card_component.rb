module Projects
  class CardComponent < ViewComponent::Base
    def initialize(project:, owner: false)
      @project = project
      @owner = owner
    end
  end
end
