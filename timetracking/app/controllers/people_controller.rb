class PeopleController < ApplicationController
	
	def index
		@people = Person.last_created_people(5)
			if @people.empty?
				render "no_people"
			end
	end

	def show
		@person = Person.find_by(id: params[:id])
		@projects = @person.projects
		@projects_no_associated = @person.select_non_associated_project
		if (@person)
			@person
		else
			render_404(params)
		end	
	end

	def update
		@project = Project.find params[:person][:projects]
		@person = Person.find(params[:id])

		@person.projects << @project
		redirect_to action: 'show', controller: 'people'
	end

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			flash[:notice] = "Person created successfully"
			redirect_to action: :index, controller: :people
		else
			flash[:alert] = "Sorry, something went wrong.."
			render 'new'
		end
	end

	private

	def person_params
		params.require(:person).permit(:name)
	end
end
