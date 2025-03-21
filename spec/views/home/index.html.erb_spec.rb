require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before do
    assign(:total_deputados, 15)
    assign(:total_despesas, 120)
    assign(:gastos_totais, 500000)
    assign(:exercicios_disponiveis, [2019, 2020, 2021])
    render
  end

  it "exibe o título principal" do
    expect(rendered).to have_text("Bem-Vindo ao Sistema de Consulta de Deputados")
  end

  it "exibe o total de deputados" do
    expect(rendered).to have_text("Total de Deputados")
    expect(rendered).to have_text("15")
  end

  it "exibe o total de despesas" do
    expect(rendered).to have_text("Total de Despesas")
    expect(rendered).to have_text("120")
  end

  it "exibe os gastos totais formatados" do
    expect(rendered).to have_text("Gastos Totais")
    expect(rendered).to have_text("R$ 500.000,00")
  end

  it "exibe os exercícios disponíveis" do
    expect(rendered).to have_text("Exercícios Disponíveis")
    expect(rendered).to have_text("2019")
    expect(rendered).to have_text("2020")
    expect(rendered).to have_text("2021")
  end

  it "exibe os botões de navegação" do
    expect(rendered).to have_link("Consultar Deputados", href: selecao_estado_path)
    expect(rendered).to have_link("Importar CSV", href: upload_despesas_path)
  end
end
