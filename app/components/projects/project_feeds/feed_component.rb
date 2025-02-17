module Projects
  module ProjectFeeds
    class FeedComponent < ViewComponent::Base
      include Turbo::StreamsHelper
      include Turbo::FramesHelper

      def initialize(project:)
        @project = project
      end

      private

      attr_reader :project
    end
  end
end
