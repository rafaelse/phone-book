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

rafael = Person.create(name: "Rafael Fernando dos Santos")
gustavo = Person.create(name: "Gustavo Aleixo")
higor = Person.create(name: "Higor Emerencio")
morita = Person.create(name: "Rogrido Morita")
renato = Person.create(name: "Renato Sisdeli")
lucas = Person.create(name: "Lucas Peterossi")
christiano = Person.create(name: "Christiano Amaral")

admin = Division.create(name: "Secretaria de Administração", parent_division: nil)
tic = Division.create(name: "Tecnologia da Informação e Comunicação", parent_division: admin)
programacao = Division.create(name: "Programação de Sistemas", parent_division: tic)
infra = Division.create(name: "Infraestrutura de Redes", parent_division: tic)
manut = Division.create(name: "Manutenção de Computadores", parent_division: tic)

Phone.create(ddr: "3209 3313", ramal: "3313", person_id: gustavo.id, division_id: manut.id)
Phone.create(ddr: "3209 3313", ramal: "3313", person_id: morita.id, division_id: manut.id)
Phone.create(ddr: "3209 3313", ramal: "3313", person_id: higor.id, division_id: manut.id)
Phone.create(ddr: "3209 3372", ramal: "3372", person_id: rafael.id, division_id: programacao.id)
Phone.create(ddr: "3209 3372", ramal: "3372", person_id: renato.id, division_id: programacao.id)
Phone.create(ddr: "3209 3372", ramal: "3372", person_id: lucas.id, division_id: programacao.id)
Phone.create(ddr: "", ramal: "3340", person_id: christiano.id, division_id: infra.id)

