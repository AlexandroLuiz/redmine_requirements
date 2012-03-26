require 'redmine'

Redmine::Plugin.register :redmine_requirements do

   name 'Requirements'
   author 'Alexandro Luiz Hilleshein'
   description 'This is a plugin for Redmine for controller of Requirements'
   version '0.0.1'
   url 'http://example.com/path/to/plugin'
   author_url 'http://example.com/about'

   project_module :requirements do
     permission :view_functional_requirements, :functional_requirements => [:index, :show]
     permission :view_additional_requirements, :additional_requirements => [:index, :show]
     permission :view_non_functional_requirements, :non_functional_requirements => [:index, :show]
     permission :create_edit_functional_requirements, :functional_requirements => [:new, :edit]
     permission :create_edit_additional_requirements, :additional_requirements => [:new, :edit]
     permission :create_edit_non_functional_requirements, :non_functional_requirements => [:new, :edit]
     permission :destroy_functional_requirements, :functional_requirements => [:destroy]
     permission :destroy_additional_requirements, :additional_requirements => [:destroy]
     permission :destroy_non_functional_requirements, :non_functional_requirements => [:destroy]
     permission :administer_categories_of_non_functional_requirements, :categories => [:index, :show, :new, :edit, :destroy]
     permission :requirements, {:requirements => [:index]}, :public => true
     menu :project_menu, :requirements, { :controller => 'requirements', :action => 'index' }, :caption => 'Requisitos', :after => :activity, :param => :project_id

  end
end

