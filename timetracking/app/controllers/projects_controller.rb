class ProjectsController < ApplicationController

	def index
		@projects = Project.last_created_projects(10)
			if @projects.empty?
				render "no_projects"
			end
	end

	def show
		@projects = Project.find_by(id: params[:id]) ||	render_404(params)
	
	##different options for avoid message 500:

		##	@projects = Project.find(params[:id])
		## rescue ActiveRecord::RecordNotFound
		##	render "no_projects_found"
	
		##unless @projects = Project.find(params[:id])
		## 	render "no_projects_found"	 

	end
end
