module ApplicationHelper
	def bootstrap_class_for flash_type
    case flash_type
      when :success
        "ls-alert-success"
      when :error
        "ls-alert-danger"
      when :alert
        "alert-block"
      when :notice
        "ls-alert-info"
      else
        flash_type.to_s
    end
  end
end
