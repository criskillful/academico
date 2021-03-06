=begin
-- Select de Pessoas Físicas
select ('
classrecords = ClassRecord.new(
         :recorded_at => '''||ARRAY_TO_STRING(ARRAY[a.data_aula],'')||''',
          :record => '''||ARRAY_TO_STRING(ARRAY[(select conteudo_ministrado from registro_aula where id = a.registro_aula_id)],'')||''',
          :note => '''||ARRAY_TO_STRING(ARRAY[a.observacao],'')||''',  
          :justification => '''||ARRAY_TO_STRING(ARRAY[a.justificativa],'')||''', 
          :discipline_class_id => '''||ARRAY_TO_STRING(ARRAY[a.classe_id],'')||''',  
          :person_id => '''||ARRAY_TO_STRING(ARRAY[(select funcionario_id from docente, vinculo where docente.vinculo_id = vinculo.id and docente.vinculo_id = a.docente_id)],'')||''',
          :class_time_id => '||ARRAY_TO_STRING(ARRAY[CASE WHEN horario_aula_id is null then '''''''' else 'ClassTime.where(:started_at => '''||(select horario_inicio from horario_aula where id = horario_aula_id)||''').where(:ended_at => '''||(select horario_fim from horario_aula where id = horario_aula_id)||''').first.id ' END],'')||',
          :class_record_type_id => '''||ARRAY_TO_STRING(ARRAY[CASE 
                                                                WHEN tipo='N' THEN '1'
                                                                WHEN tipo='A' THEN '2'
                                                                WHEN tipo='3' THEN '3'                                                                
                                                                ELSE ''
                                                              END],'')||'''
         )
classrecords.id = '||a.id||'
classrecords.save!         
       ') as comando
from aula a
order by id;

--Comando em arquivo

psql -U postgres -h localhost -d dbsiga-edu -c select ('
classrecords = ClassRecord.new(
         :recorded_at => '''||ARRAY_TO_STRING(ARRAY[a.data_aula],'')||''',
          :record => '''||ARRAY_TO_STRING(ARRAY[(select conteudo_ministrado from registro_aula where id = a.registro_aula_id)],'')||''',
          :note => '''||ARRAY_TO_STRING(ARRAY[a.observacao],'')||''',  
          :justification => '''||ARRAY_TO_STRING(ARRAY[a.justificativa],'')||''', 
          :discipline_class_id => '''||ARRAY_TO_STRING(ARRAY[a.classe_id],'')||''',  
          :person_id => '''||ARRAY_TO_STRING(ARRAY[(select funcionario_id from docente, vinculo where docente.vinculo_id = vinculo.id and docente.vinculo_id = a.docente_id)],'')||''',
          :class_time_id => '||ARRAY_TO_STRING(ARRAY[CASE WHEN horario_aula_id is null then '''''''' else 'ClassTime.where(:started_at => '''||(select horario_inicio from horario_aula where id = horario_aula_id)||''').where(:ended_at => '''||(select horario_fim from horario_aula where id = horario_aula_id)||''').first.id ' END],'')||',
          :class_record_type_id => '''||ARRAY_TO_STRING(ARRAY[CASE 
                                                                WHEN tipo='N' THEN '1'
                                                                WHEN tipo='A' THEN '2'
                                                                WHEN tipo='3' THEN '3'                                                                
                                                                ELSE ''
                                                              END],'')||'''
         )
classrecords.id = '||a.id||'
classrecords.save!         
       ') as comando
from aula a
order by id; > aulas


-- Comando no postgres para solucionar o problema de concatenação com valor nulo
ARRAY_TO_STRING(ARRAY[],'')


-- Comando console de load

load db/seeds_migracao/seeds_aulas.rb

=end

# Alimenta tabela de Departamentos com as instituicoes Ex: Insituto Federald e Brasília
puts 'Inserindo Aulas'
ClassRecord.delete_all
ActiveRecord::Migration.execute("SELECT SETVAL('class_records_id_seq', 1, false);")

## Colar o código aqui

#Atualiza sequence
ActiveRecord::Migration.execute("SELECT SETVAL('class_records_id_seq', (select max(id) from class_records), true);")