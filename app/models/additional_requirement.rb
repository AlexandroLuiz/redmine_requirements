class AdditionalRequirement < ActiveRecord::Base


#Relacionamentos

belongs_to :project

belongs_to :category



#Validações

validates_presence_of :name

validates_length_of  :name, :maximum=>255, :message=>"o nome não pode exceder os 255 caracteres!"

validates_length_of  :restriction, :maximum=>1000, :message=>"não pode exeder os 255 caracteres!"

validates_presence_of :project_id

validates_presence_of :category_id

end

