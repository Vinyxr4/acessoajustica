Feature: Register a Cliente
  As a 'Calouro'
  I Want to register a 'Cliente'
  In order to create a 'Atendimento'

  @javascript
  Scenario: Register a valid 'Cliente'
    Given I am logged as "calouro"
    And exists a "moradia_type"
    And exists a "estado_civil"
    And exists a "profissao_type"
    And exists a "profissao_type"
    And exists a "atendimento"
    And I am on "clientes new"
    And I wait a second
    And I take "cliente" picture of the page
    And I fill in "cliente codigo" with "10.XX.0392023"
    And I fill in "cliente nome" with "Athena"
    And I fill in "cliente nome da mae" with "Métis"
    And I fill in "cliente cpf" with "111.111.111-11"
    And I fill in "cliente rg" with "11.111.111-1"
    And I fill in "cliente rg" with "11.111.111-1"
    And I fill in "cliente cor" with "amarelo"
    And I fill in "cliente identidade de genero" with "feminino"
    And I fill in "cliente cep" with "04732-123"
    And I fill in "cliente estado" with "SP"
    And I fill in "cliente cidade" with "São Paulo"
    And I fill in "cliente bairro" with "Interlagos"
    And I fill in "cliente endereco" with "Rua João de Barro, 10"
    And I select the option "Solteiro" in "cliente estado civil id"
    And I choose "cliente tem filhos true"
    And I fill in "cliente menores moram quantidades" with "1"
    And I fill in "cliente menores nao moram quantidades" with "1"
    And I fill in "cliente maiores moram quantidades" with "1"
    And I fill in "cliente maiores nao moram quantidades" with "1"
    And I fill in "cliente profissao nome" with "Guerreira"
    And I choose "cliente faz bicos false"
    And I select the option "Registrado" in "cliente profissao type id"
    And I fill in "cliente salario" with "1.100,00"
    And I fill in "cliente familia renda" with "1.100,00"
    And I fill in "cliente contribuintes quantidade" with "1"
    And I fill in "cliente familia quantidade" with "1"
    And I select the option "Outra" in "cliente moradia type id"
    And I fill in "cliente telefone contato" with "(11)5555-5555"
    And I fill in "cliente alimentacao despesa" with "100,00"
    And I fill in "cliente saude" with "100,00"
    And I fill in "cliente aluguel" with "100,00"
    And I fill in "cliente condominio" with "100,00"
    And I fill in "cliente agua" with "100,00"
    And I fill in "cliente luz" with "100,00"
    And I fill in "cliente gas" with "100,00"
    And I fill in "cliente telefone despesa" with "100,00"
    And I fill in "cliente transporte" with "100,00"
    And I fill in "cliente educacao" with "100,00"
    And I fill in "cliente obrigacoes judiciais" with "100,00"
    And I fill in "cliente financiamentos" with "100,00"
    And I fill in "cliente iptu" with "100,00"
    And I fill in "cliente total despesas fixas" with "100,00"
    And I fill in "cliente valor liquido rendimento mensal" with "100,00"
    And I select the option "Não" in "cliente atendimento status"
    And I press "Criar Cliente"
    Then I should see "Cliente was successfully created."

    @javascript
    Scenario: 'Admin' Register a valid 'Cliente'
      Given I am logged as "admin"
      And exists a "moradia_type"
      And exists a "estado_civil"
      And exists a "profissao_type"
      And exists a "profissao_type"
      And exists a "atendimento"
      And I am on "clientes new"
      And I fill in "cliente codigo" with "10.XX.0392023"
      And I fill in "cliente nome" with "Athena"
      And I fill in "cliente nome da mae" with "Métis"
      And I fill in "cliente cpf" with "111.111.111-11"
      And I fill in "cliente rg" with "11.111.111-1"
      And I fill in "cliente rg" with "11.111.111-1"
      And I fill in "cliente cor" with "amarelo"
      And I fill in "cliente identidade de genero" with "feminino"
      And I fill in "cliente cep" with "04732-123"
      And I fill in "cliente estado" with "SP"
      And I fill in "cliente cidade" with "São Paulo"
      And I fill in "cliente bairro" with "Interlagos"
      And I fill in "cliente endereco" with "Rua João de Barro, 10"
      And I select the option "Solteiro" in "cliente estado civil id"
      And I choose "cliente tem filhos true"
      And I fill in "cliente menores moram quantidades" with "1"
      And I fill in "cliente menores nao moram quantidades" with "1"
      And I fill in "cliente maiores moram quantidades" with "1"
      And I fill in "cliente maiores nao moram quantidades" with "1"
      And I fill in "cliente profissao nome" with "Guerreira"
      And I choose "cliente faz bicos false"
      And I select the option "Registrado" in "cliente profissao type id"
      And I fill in "cliente salario" with "1.100,00"
      And I fill in "cliente familia renda" with "1.100,00"
      And I fill in "cliente contribuintes quantidade" with "1"
      And I fill in "cliente familia quantidade" with "1"
      And I select the option "Outra" in "cliente moradia type id"
      And I fill in "cliente telefone contato" with "(11)5555-5555"
      And I fill in "cliente alimentacao despesa" with "100,00"
      And I fill in "cliente saude" with "100,00"
      And I fill in "cliente aluguel" with "100,00"
      And I fill in "cliente condominio" with "100,00"
      And I fill in "cliente agua" with "100,00"
      And I fill in "cliente luz" with "100,00"
      And I fill in "cliente gas" with "100,00"
      And I fill in "cliente telefone despesa" with "100,00"
      And I fill in "cliente transporte" with "100,00"
      And I fill in "cliente educacao" with "100,00"
      And I fill in "cliente obrigacoes judiciais" with "100,00"
      And I fill in "cliente financiamentos" with "100,00"
      And I fill in "cliente iptu" with "100,00"
      And I fill in "cliente total despesas fixas" with "100,00"
      And I fill in "cliente valor liquido rendimento mensal" with "100,00"
      And I select the option "Não" in "cliente atendimento status"
      And I press "Criar Cliente"
      Then I should see "Cliente was successfully created."
