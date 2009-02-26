module OrganizationsHelper
  def web_site_url_column(record)
    if (!record.web_site_url.blank?)
      "<b><a href='" + record.web_site_url + "'>#{record.web_site_url}</a></b>"
    else
      '-'
    end
  end
  
  def description_column(record)
    if (record.description != nil)
      record.description.gsub("\n", "<br />")
    end
  end
end
