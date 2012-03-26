class NonFunctionalRequirementsController < ApplicationController
   unloadable

   menu_item :requirements
 #filter the current project
  before_filter :current_project
  #filtro para analizar as permições
  before_filter :authorize, :only => [:show, :new, :edit, :destroy ]

  # GET /non_functional_requirements/1
  # GET /non_functional_requirements/1.xml
  def show
    @non_functional_requirement = NonFunctionalRequirement.find(params[:id])
    @functional_requirement = FunctionalRequirement.find(@non_functional_requirement.functional_requirement_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @non_functional_requirement }
    end
  end

  # GET /non_functional_requirements/new
  # GET /non_functional_requirements/new.xml
  def new
    @non_functional_requirement = NonFunctionalRequirement.new
    @functional_requirement = FunctionalRequirement.find(params[:functional_requirement_id])
    @categories = Category.find(:all).collect{|category| [category.name,category.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @non_functional_requirement }
    end
  end

  # GET /non_functional_requirements/1/edit
  def edit
    @non_functional_requirement = NonFunctionalRequirement.find(params[:id])
    @functional_requirement = FunctionalRequirement.find(params[:functional_requirement_id])
    @categories = Category.find(:all).collect{|category| [category.name,category.id]}
  end

  # POST /non_functional_requirements
  # POST /non_functional_requirements.xml
  def create
    @non_functional_requirement = NonFunctionalRequirement.new(params[:non_functional_requirement])
    @functional_requirement = FunctionalRequirement.find(@non_functional_requirement.functional_requirement_id)


    respond_to do |format|
      if @non_functional_requirement.save
        format.html { redirect_to(project_functional_requirement_url(@project,@functional_requirement), :notice => l(:notice_successful_create)) }
        format.xml  { render :xml => @non_functional_requirement, :status => :created, :location => @non_functional_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @non_functional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /non_functional_requirements/1
  # PUT /non_functional_requirements/1.xml
  def update
     @non_functional_requirement = NonFunctionalRequirement.find(params[:id])
     respond_to do |format|
      if @non_functional_requirement.update_attributes(params[:non_functional_requirement])
        format.html { redirect_to(project_functional_requirement_url(@project,@non_functional_requirement.functional_requirement_id), :notice => l(:notice_successful_update)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @non_functional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /non_functional_requirements/1
  # DELETE /non_functional_requirements/1.xml
  def destroy
    @non_functional_requirement = NonFunctionalRequirement.find(params[:id])
    @non_functional_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(project_functional_requirement_url(@project,@non_functional_requirement.functional_requirement_id)) }
      format.xml  { head :ok }
    end
  end

   private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

