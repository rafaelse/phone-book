# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Phone.delete_all
Division.delete_all
Person.delete_all
User.delete_all
Phone.search_index.clean_indices
Division.search_index.clean_indices
Person.search_index.clean_indices

rafael = Person.create(name: "Rafael Fernando dos Santos")
gustavo = Person.create(name: "Gustavo Aleixo")
higor = Person.create(name: "Higor Emerencio")
morita = Person.create(name: "Rogrido Morita")
renato = Person.create(name: "Renato Sisdeli")
lucas = Person.create(name: "Lucas Peterossi")
christiano = Person.create(name: "Christiano Amaral")
andressa = Person.create(name: "Andressa Aparecida Affonso")
silvia = Person.create(name: "Sílvia Helena Evaristo Silva")
ivana = Person.create(name: "Ivana Maria Marques Quintino")
renata = Person.create(name: "Renata")


admin = Division.create(name: "Secretaria de Administração", parent_division: nil)
tic = Division.create(name: "Tecnologia da Informação e Comunicação", parent_division: admin)
programacao = Division.create(name: "Programação de Sistemas", parent_division: tic)
infra = Division.create(name: "Infraestrutura de Redes", parent_division: tic)
manut = Division.create(name: "Manutenção de Computadores", parent_division: tic)
rh = Division.create(name: "Recursos Humanos", parent_division: admin)
cf = Division.create(name: "Cadastro Funcional", parent_division: rh)
drh = Division.create(name: "Desenvolvimento de Recursos Humanos", parent_division: rh)
compras = Division.create(name: "Compras", parent_division: admin)
cec = Division.create(name: "Compras e Contratos", parent_division: compras)
material = Division.create(name: "Material", parent_division: compras)
patrimonio = Division.create(name: "Patrimônio", parent_division: compras)
ag = Division.create(name: "Almoxarifado Geral", parent_division: compras)
ca = Division.create(name: "Comunicação Administrativa", parent_division: admin)
protocolo = Division.create(name: "Protocolo", parent_division: ca)
arq_geral = Division.create(name: "Arquivo Geral", parent_division: ca)
sp = Division.create(name: "Sistema Prático", parent_division: ca)


Phone.create(ddr: '(16) 3209 3313', branch:  3313, person_id: gustavo.id, division_id: manut.id)
Phone.create(ddr: '(16) 3209 3313', branch:  3313, person_id: morita.id, division_id: manut.id)
Phone.create(ddr: '(16) 3209 3313', branch:  3313, person_id: higor.id, division_id: manut.id)
Phone.create(ddr: '(16) 3209 3372', branch:  3372, person_id: rafael.id, division_id: programacao.id)
Phone.create(ddr: '(16) 3209 3372', branch:  3372, person_id: renato.id, division_id: programacao.id)
Phone.create(ddr: '(16) 3209 3372', branch:  3372, person_id: lucas.id, division_id: programacao.id)
Phone.create( branch:  3340, person_id: christiano.id, division_id: infra.id)
Phone.create(ddr: '(16) 3209 3315', branch:  3315, person_id: andressa.id, division_id: cf.id)
Phone.create(ddr: '(16) 3209 3315', branch:  3315, person_id: andressa.id, division_id: drh.id)
Phone.create(ddr: '(16) 3209 3309', branch:  3309, person_id: silvia.id, division_id: cec.id)
Phone.create(ddr: '(16) 3209 3309', branch:  3309, person_id: silvia.id, division_id: material.id)
Phone.create(ddr: '(16) 3209 3309', branch:  3309, person_id: silvia.id, division_id: patrimonio.id)
Phone.create(ddr: '(16) 3209 3309', branch:  3309, person_id: silvia.id, division_id: ag.id)
Phone.create(ddr: '(16) 3209 3314', branch:  3314, person_id: ivana.id, division_id: protocolo.id)
Phone.create(ddr: '(16) 3209 3314', branch:  3314, person_id: ivana.id, division_id: arq_geral.id)
Phone.create(ddr: '(16) 3209 3314', branch:  3339, person_id: renata.id, division_id: sp.id)

User.new(name: 'rafael', password: '123456', password_confirmation: '123456', admin: true).save(validate: false)

Phone.reindex
Division.reindex
Person.reindex


