module ActivitiesHelper
  
  def activity_action_and_object(activity)
    activity.action = "reply" if activity.activitable_type == "comment"
    action = I18n.t("common.actions.#{activity.action}")
    object = I18n.t("common.types.#{activity.activitable_type}")
    "#{action} #{object}"
  end
  
  def activity_action_postfix(activity)
    if activity.action == "rate"
      "#{I18n.t('common.with')}"
    elsif activity.action == "comment"
      "#{I18n.t('common.as')}"
    else
      ""
    end
  end  
end