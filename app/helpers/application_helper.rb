module ApplicationHelper
  def beta_v2_enabled?
    @beta_v2_enabled ||= Content.flipper[:beta_v2].enabled?
  end
end
