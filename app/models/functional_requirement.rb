class FunctionalRequirement < ActiveRecord::Base


#Relacionamentos

belongs_to :project

has_many :non_functional_requirements, :dependent => :delete_all



#Validações

validates_length_of  :name, :maximum=>100, :message=>" não pode exceder 100 caracteres!"

validates_length_of  :description, :maximum=>1000, :message=>" não pode exceder 1000 caracteres!"

validates_presence_of :name, :message=>" não pode ser vazio!"

validates_presence_of :project_id

#metodos


def cont
  cont_all = 0
  self.each do
    cont_all += 1;
  end
  cont_all
end



end

