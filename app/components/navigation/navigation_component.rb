class Navigation::NavigationComponent < ViewComponent::Base
  def initialize(user:, hide_auth_links: false)
    @user = user
    @hide_auth_links = hide_auth_links
  end
end
