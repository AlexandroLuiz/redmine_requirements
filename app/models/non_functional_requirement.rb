class NonFunctionalRequirement < ActiveRecord::Base


#Relacionamentos

belongs_to :category

belongs_to :functional_requirement



#Validações

validates_presence_of  :name,  :message=>"não pode ficar em branco!"

validates_length_of  :name, :maximum=>255, :message=>"não pode exeder os 255 caracteres!"

validates_length_of  :restriction, :maximum=>255, :message=>"não pode exeder os 255 caracteres!"

validates_presence_of :category_id



end

