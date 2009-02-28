# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  FLASH_NOTICE_KEYS = [:error, :notice, :warning]

  def photo_image_tag(record)
    image_tag record.photo.public_filename(:thumb) if (!record.photo.blank?)
  end

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :id => 'flash', :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end

	def if_admin?
    yield if logged_in? && current_user.has_role?('admin')
	end

	def if_logged_in?
		yield if logged_in?
	end

	def if_recaptcha?
		yield if @bad_visitor
	end

	def focus_on_div(div)
	  update_page do |page|
	    page[div].focus
	  end
	end

end
