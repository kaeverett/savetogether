class RootController < ApplicationController
  helper OrganizationsHelper
  
  def index
    @orgs = Organization.find_featured_organizations
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def about_us
  end

  def faq
  end

  def why_savings
  end
end
