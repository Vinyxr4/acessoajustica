# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Creating estado_civil's
EstadoCivil.create!(:description => "Solteiro")
EstadoCivil.create!(:description => "Casado")
EstadoCivil.create!(:description => "Separação de Fato")
EstadoCivil.create!(:description => "Separação Judicial")
EstadoCivil.create!(:description => "Viúvo")
EstadoCivil.create!(:description => "Viúve em União Estável")

# Creating profissao's
ProfissaoType.create!(:description => "Primário")
ProfissaoType.create!(:description => "Secundário")
ProfissaoType.create!(:description => "Terciário")

# Creating atendimento_types
AtendimentoType.create!(:description => "Atendimento")
AtendimentoType.create!(:description => "Orientação")

# Creating roles.
admin_role = Role.create!(:name => "admin")
diretor_role = Role.create!(:name => "diretor")
vareiro_role = Role.create!(:name => "vareiro")
calouro_role = Role.create!(:name => "calouro")
estagiario_role = Role.create!(:name => "estagiário")

admin_user = User.create!(:email=>'test@test.com',:username=>'admin',:password=>'password')
admin_user.roles << admin_role

# Creating moradia_types
MoradiaType.create!(:description => "Casa")
MoradiaType.create!(:description => "Apartamento")
MoradiaType.create!(:description => "Pensão")
MoradiaType.create!(:description => "República")
MoradiaType.create!(:description => "Alvenaria")
MoradiaType.create!(:description => "Palafita")
MoradiaType.create!(:description => "Quitinete")

case Rails.env
  when "development"


    # Creating admin users
    estagiario_user = User.create!(:email=>'estagiario@test.com',:username=>'estagiario',:password=>'password')
    calouro_user = User.create!(:email=>'calouro@test.com',:username=>'calouro',:password=>'password')
    vareiro_user = User.create!(:email=>'vareiro@test.com',:username=>'vareiro',:password=>'password')
    diretor_user = User.create!(:email=>'diretor@test.com',:username=>'diretor',:password=>'password')

    #Creating especialidades
    Especialidade.create!(:description => "Criminal");
    Especialidade.create!(:description => "Penal");

    # assign the admin role to the admin user.  (This bit of rails
    # magic creates a user_role record in the database.)
    estagiario_user.roles << estagiario_role
    calouro_user.roles << calouro_role
    vareiro_user.roles << vareiro_role
    diretor_user.roles << diretor_role

    # Creating cliente
    cliente = Cliente.create!(:nome => "João da Silva",
              :cpf  => "123.456.789-00",
              :nome_da_mae => "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :filhos_quantidade  => 6,
              :profissao_nome  => "Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4)

    estagiario = Estagiario.create!(:nome => "Joana Silveira ",
              :cpf =>"123.456.789-00",
              :nome_da_mae  =>  "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero  => "Homem",
              :ano_faculdade  => "1991-03-02")

    estagiario_user.membro_id = estagiario.membro.id
    estagiario_user.save

    estagiario_diretor = Estagiario.create!(:nome => "Joana Diretora",
              :cpf =>"123.456.789-01",
              :nome_da_mae  =>  "Maria Diretora",
              :rg  => "12.345.678-0",
              :cor  => "Negro",
              :identidade_de_genero  => "Mulher",
              :ano_faculdade  => "1991-03-02")

    diretor_user.membro_id = estagiario_diretor.membro.id
    diretor_user.save

    resultado_type = AtendimentoResultado.create!(:description => "Orientação")

    # Creating atendimento
    atendimento1 = Atendimento.create!(:status => true, :cliente => cliente)
    atendimento2 = Atendimento.create!(:status => false, :cliente => cliente)
    atendimento3 = Atendimento.create!(:status => true, :cliente => cliente, :estagiario => estagiario,
      :atendimento_resultado => resultado_type)

    # Creating relato
    relato = Relato.create!(:description => "Relato teste para teste que será testado nesse teste.",
            :atendimento => atendimento1)

    cliente2 = Cliente.create!( :nome => "Abreu da Silva Sauro",
              :cpf  =>"123.456.789-00",
              :nome_da_mae => "Maria d,a Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :filhos_quantidade  => 6,
              :profissao_nome  =>"Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4)

    # Creating atendimento
    atendimento3 = Atendimento.create!(:status => true, :cliente => cliente2)

    # Creating relato
    relato = Relato.create!(:description => "Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste.",
            :atendimento => atendimento3)
end
