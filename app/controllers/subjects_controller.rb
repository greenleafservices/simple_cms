class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    #     Having an object here ()@subject) allows us, or rails, or even our database to set default values for the object's attributes. If left out, all those form values would just simply be blank but by defining it, then we'll get any default values that have been set. Those will be passed along to our form.
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params) #private def below
    # Save the object
    if @subject.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)  # resourceful route back to index page
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template
    end
  end

  def edit
      @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form parameters
      @subject = Subject.find(params[:id])
      # Update the object
      if @subject.update_attributes(subject_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "Subject updated successfully."
        redirect_to(subject_path(@subject))
      else
        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    # show notice and redirect to index
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
