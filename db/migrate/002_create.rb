class Create < ActiveRecord::Migration

  class Category < ActiveRecord::Base; end

  def self.up

    create_table "categories", :force => true do |t|
      t.column :name, :string,:limit => 100, :default => "", :null => false
      t.column :description, :text
      t.timestamps
      end

    create_table "functional_requirements", :force => true do |t|
      t.column :name, :string, :limit => 100, :default => "", :null => false
      t.column :description, :text
      t.column :hidden, :boolean, :default => false
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
      t.timestamps
    end

    create_table "non_functional_requirements", :force => true do |t|
      t.column :name, :string, :limit => 100, :default => "", :null => false
      t.column :restriction, :text
      t.column :desirable, :boolean, :default => false
      t.column :permanent, :boolean, :default => false
      t.column "functional_requirement_id", :integer, :default => 0, :null => false
      t.column "category_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
      t.timestamps
    end

    create_table "additional_requirements", :force => true do |t|
      t.column :name, :string, :limit => 100, :default => "", :null => false
      t.column :restriction, :text
      t.column :desirable, :boolean, :default => false
      t.column :permanent, :boolean, :default => false
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "category_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
      t.timestamps
    end

     Category.create :name => "Usabilidade",
                    :description => "Os fatores humanos envolvidos no sistema; O tipo de ajuda que o programa deve prover; As formas de documentação ou manuais disponíveis; Como esses manuais vão ser produzidos; O tipo de informação que eles vão conter; Seria interessante definir esses tópicos na fase de concepção, visto que o contrato com o cliente deveria especificar muitas dessas questões. (VAZLAWICK, 2004, p. 41)"

    Category.create :name => "Confiabilidade",
                    :description => "Tratamento de falhas no sistema; O analista não é obrigado a produzir um sistema totalmente tolerante a falhas, mas deve estabelecer que tipo de falhas o sistema será capaz de gerenciar: falta de energia, falha de comunicação, falha de mídia de gravação etc. Não se deve confundir falha com erro de programação, pois erros de programação são elementos que nenhum software deveria conter. As falhas são situações anormais que podem ocorrer mesmo para um software implementado sem nenhum erro de programação. (VAZLAWICK, 2004, p. 41)"
    Category.create :name => "Performance",
                    :description => "a eficiência e a precisão apresentada pelo sistema. Na fase de concepção não se define como o sistema fará para cumprir o requisito, apenas se diz que de alguma forma ele terá de ser cumprido no projeto. Cabe ao projetista e ao programador garantir que o requisito seja satisfeito. Se o analista por algum motivo conclui que o requisito não pode ser cumprido, então o requisito passa a ser um risco do sistema e eventualmente necessitará de um estudo ainda mais aprofundado na fase de concepção, para verificar a possibilidade de sua realização. (VAZLAWICK, 2004, p. 41)"

    Category.create :name => "Configurabilidade",
                    :description => "o que pode ser configurado no sistema; o que pode ser configurado pelo usuário sem alterações no código do sistema. (VAZLAWICK, 2004, p. 42)"

    Category.create :name => "Segurança",
                    :description => "definir os tipos de usuários e que funções cada um pode executar. (VAZLAWICK, 2004, p. 42)"

    Category.create :name => "Implementação",
                    :description => "definir a linguagem a ser usada, assim como bibliotecas disponíveis, e bancos de dados acessíveis. (VAZLAWICK, 2004, p. 42)"

    Category.create :name => "Interface",
                    :description => "como vai ser a interface? Vai ser seguida alguma norma ergonômica? (VAZLAWICK, 2004, p. 42)"

    Category.create :name => "Legais",
                    :description => "muitas vezes uma equipe de desenvolvimento deve contar com uma assessoria jurídica para saber se está infringindo direitos autorais ou normas específicas da área para a qual a qual o software está sendo desenvolvido. (VAZLAWICK, 2004, p. 42)"

  end


  def self.down
    drop_table :categories
    drop_table :functional_requirements
    drop_table :non_functional_requirements
    drop_table :additional_requirements
    end



end

