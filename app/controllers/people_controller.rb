class PeopleController < ApplicationController

  def index
    activities = Activity.find(params[:activity_id])
    @people = @person.activity
    render json: @people

  end


  def create
    @person = Person.new(person_params)

    if @person.save!
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end

  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update!(person_params)
      render json: @person, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    # redirect_to people_path
  end

private
  def person_params
    params.require(:person).permit(:name)
  end

end
