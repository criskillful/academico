module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  # O Método verifica_registro é responsável por verificar se há algum registro no campo desejado
  # e criado com o objetivo de preencher espaços vazios com uma mensagem em campos sem registro para atender o
  # layout da página para que não deforme a mesma com sobreposições de <div> sobre outra por não haver registro.
  # Exemplos de utilização:
  #
  # 1)Quando o campo faz referencia a outra model:
  #  Antes: <dd><%= @person_address.street_type_id %></dd>
  #  Depois: <dd><%= verifica_registro(:campo => @person_address.street_type, :atributo => "description") %></dd>
  # 2)Quando o campo é atributo próprio da model:
  #  Antes: <dd><%= @person_address.street_name %></dd>
  #  Depois: <dd><%= verifica_registro(:campo => @person_address.street_name) %></dd>
  # 3)Quando desejar mudar a mensagem padrão:
  #  Antes: <dd><%= @person_address.street_name %></dd>
  #  Depois: <dd><%= verifica_registro(:campo => @person_address.street_name, :mensagem => "Outra Mensagem Qualquer") %></dd>
  #  Fim

  def verifica_registro(opcoes)
    @mensagem = opcoes[:mensagem]||="<<Sem Registro>>"
    @campo = opcoes[:campo].to_s||= @mensagem
    @campo.strip!
    if opcoes[:atributo].nil?
      @campo.blank? ? @mensagem : opcoes[:campo]
    else
      @campo.blank? ? @mensagem : opcoes[:campo].send(opcoes[:atributo])
    end
  end
  
  #Metodo para gerar o Menu de Configurações
  def menu_config
    #Array para determinar as controllers desejadas e grupos
    #Aqui são definido os grupos em que as Models podem ser agrupadas de acordo com sua relação com as principais models
    array_groups = ['Gerais',
                    'Itens de Pessoas',
                    'Itens de Matriz',
                    'Itens de Institucional']
    #Neste array são definidos o nome da controller, o título que aparecerá na view e o grupo que se refere criado no array_groups acima
    #Estrutura: [[<nome_da_controller>,<texto_que_aparece_na_view>,<nome_do_grupo_refererenciado_no_array_groups>]]
    array_controllers = [['countries','Países / Estados / Cidades','Gerais'], 
                         ['education_modalities', 'Modalidades','Itens de Institucional'], 
                         ['education_steps','Graus','Itens de Institucional'], 
                         ['education_levels','Níveis','Itens de Matriz'], 
                         ['techaxis_types','Eixos Tecnológicos / Áreas','Itens de Institucional'], 
                         ['races','Etnias','Itens de Pessoas']]
    #Ordena o Array de controllers e Grupos
    array_controllers = array_controllers.sort {|x,y| y <=> x }
    array_groups = array_groups.sort
    #conta o tamanho dos Arrays
    array_count_groups = array_groups.count
    array_count_controllers = array_controllers.count
    #Variável que cria o Menu
    menu_config = "<li class='nav-header'>Cadastros Básicos</li>
                    <div class='accordion' id='menu1'>"
    
    #Markup para Menu DropDown com iterações para a criacao do menu
    for j in 0...array_count_groups
      menu_config << "<div class=\"accordion-group\">
        <div class=\"accordion-heading\">
          <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#menu1\" href=\"#collapse#{j}\">
            <h4>#{array_groups[j]}</h4>
          </a>
        </div>
        <div id=\"collapse#{j}\" class=\"accordion-body collapse\">"
        for i in 0...array_count_controllers do
          if array_controllers[i][2] == array_groups[j]
            menu_config << "<div class=\"accordion-inner\">
                              <li class='#{"#{array_controllers[i][0]}" == params[:controller] ? 'active' : '' }'><a href=#{send("#{array_controllers[i][0]}_path")} ><i class='icon-file'></i>#{array_controllers[i][1]}</li></a>
                            </div>"
          end  
        end
      menu_config << "</div>
                    </div>"
    end
    menu_config << "</div>" #Fechamento da Div do menu
    raw menu_config #mostra toda a estrutura criada na def em html - retorno do método
  end
end


