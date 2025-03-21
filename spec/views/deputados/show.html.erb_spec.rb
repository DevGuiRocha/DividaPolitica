require 'rails_helper'

RSpec.describe "deputados/show", type: :view do
  before do
    deputado = create(:deputado, nome: "Carlos Lima", partido: "MDB", estado: "BA", ide_cadastro: 789)
    assign(:deputado, deputado)
    assign(:total_despesas, 50000)
    assign(:despesas, [
      create(:despesa, deputado: deputado, fornecedor: "Empresa XYZ", valor_liquido: 2000),
      create(:despesa, deputado: deputado, fornecedor: "Empresa ABC", valor_liquido: 3000)
    ])
    render
  end

  it "exibe o nome do deputado" do
    expect(rendered).to have_text("Carlos Lima")
  end

  it "exibe o total de despesas" do
    expect(rendered).to have_text("Total de Despesas:")
    expect(rendered).to have_text("R$ 50.000,00")
  end

  it "exibe a lista de despesas" do
    expect(rendered).to have_text("Empresa XYZ")
    expect(rendered).to have_text("Empresa ABC")
  end
end
