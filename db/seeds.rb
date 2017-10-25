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
morita = Person.create(name: "Rodrigo Morita")
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


Phone.create(ddr: '(16) 3209 3313', branch:  3313, people: [gustavo, morita, higor], divisions: [manut])
Phone.create(ddr: '(16) 3209 3372', branch:  3372, people: [rafael, lucas, renato], divisions: [programacao])
Phone.create( branch:  3340, people: [christiano], divisions: [infra])
Phone.create(ddr: '(16) 3209 3315', branch:  3315, people: [andressa], divisions: [cf, drh])
Phone.create(ddr: '(16) 3209 3309', branch:  3309, people: [silvia], divisions: [cec, material, patrimonio, ag])
Phone.create(ddr: '(16) 3209 3314', branch:  3314, people: [ivana], divisions: [protocolo, arq_geral])
Phone.create(ddr: '(16) 3209 3314', branch:  3339, people: [renata], divisions: [sp])

User.new(name: 'rafael', password: '123456', password_confirmation: '123456', admin: true).save(validate: false)

Phone.reindex
Division.reindex
Person.reindex


