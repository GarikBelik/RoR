class ApplicationController < ActionController::Base
	add_flash_types :success, :danger, :not_editor
	before_action :authenticate_user!, except: [:index, :show]
end
