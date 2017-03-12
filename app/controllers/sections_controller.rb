class SectionsController < ApplicationController

    layout 'admin'

  def index
    @sections = Section.sorted # ==> multiple instance
  end

  def show
      @section = Section.find(params[:id]) # ==> single instance
  end

  def new
    @section = Section.new({:name => 'Default'})
    # Add 1 to section count - in case this is for a new section
    # Pass this to the partial form
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    # Instantiate a new object using form parameters
    @section = Section.new(section_params) #private def below
    # Save the object
    if @section.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path)  # resourceful route back to index page
    else
      # If save fails, redisplay the form so user can fix problems
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    # Find a new object using form parameters
      @section = Section.find(params[:id])
      # Update the object
      if @section.update_attributes(section_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "Section updated successfully."
        redirect_to(section_path(@section))
      else
        @section_count = Section.count
        @pages = Page.sorted
        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end

  def delete
      @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    # show notice and redirect to index
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content, :content_type)
  end

end
