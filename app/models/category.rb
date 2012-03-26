class Category < ActiveRecord::Base

#Relacionamentos

has_many :not_functional_requierements

has_many :additional_requirements

belongs_to :project



#Validações

validates_presence_of  :name, :message=>"o nome não pode ficar em branco"

validates_length_of  :name, :maximum=>255, :message=>"o nome não pode exeder os 255 caracteres!"

validates_length_of  :description, :maximum=>1000, :message=>"a descricão não pode exeder os 255 caracteres!"



end

