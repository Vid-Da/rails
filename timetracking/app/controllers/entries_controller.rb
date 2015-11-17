class EntriesController < ApplicationController

	def index
		@entries = Project.find_by(params[:id]).entries

	##entries = Entry.where(project_id: params[:id])	
	end
end
