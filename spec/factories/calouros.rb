FactoryGirl.define do
  factory :calouro do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    identidade_de_genero "Homem"
    ano_faculdade "1991-03-02"

    trait :calouro_invalid do
      nome nil
    end
    trait :new_calouro do
      nome "Criminal da Silva"
    end
  end
end
