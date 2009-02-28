class Admin::MailingsController < ApplicationController
	before_filter :login_required
	require_role :admin

	def create
	end
end
