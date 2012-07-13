class AdditionalRequirementsController < ApplicationController
 unloadable

   menu_item :requirements
  #filter the current project
  before_filter :current_project
  #filtro para analizar as permições para o metodo index
  before_filter :authorize, :only => [:index, :show, :new, :edit, :destroy]


  # GET /additional_requirements
  # GET /additional_requirements.xml
  def index
    @additional_requirements = AdditionalRequirement.find_all_by_project_id(:project_id)

    @additional_requirement_count = @additional_requirements.size
    @additional_requirement_pages = Paginator.new self, @additional_requirement_count, per_page_option, params['page']
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additional_requirements }
    end
  end

  # GET /additional_requirements/1
  # GET /additional_requirements/1.xml
  def show
    @additional_requirement = AdditionalRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @additional_requirement }
    end
  end

  # GET /additional_requirements/new
  # GET /additional_requirements/new.xml
  def new
    @additional_requirement = AdditionalRequirement.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @additional_requirement }
    end
  end

  # GET /additional_requirements/1/edit
  def edit
    @additional_requirement = AdditionalRequirement.find(params[:id])

  end

  # POST /additional_requirements
  # POST /additional_requirements.xml
  def create
    @additional_requirement = AdditionalRequirement.new(params[:additional_requirement])
    @additional_requirement.project_id  = @project.id

    respond_to do |format|
      if @additional_requirement.save
        format.html { redirect_to(project_additional_requirements_url, :notice => l(:notice_successful_create)) }
        format.xml  { render :xml => @additional_requirement, :status => :created, :location => @additional_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @additional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additional_requirements/1
  # PUT /additional_requirements/1.xml
  def update
    @additional_requirement = AdditionalRequirement.find(params[:id])

    respond_to do |format|
      if @additional_requirement.update_attributes(params[:additional_requirement])
        format.html { redirect_to(project_additional_requirements_url, :notice => l(:notice_successful_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @additional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_requirements/1
  # DELETE /additional_requirements/1.xml
  def destroy
    @additional_requirement = AdditionalRequirement.find(params[:id])
    @additional_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(project_additional_requirements_url(@project)) }
      format.xml  { head :ok }
    end
  end

   private
   def current_project
      @project = Project.find(params[:project_id])
 end
end

