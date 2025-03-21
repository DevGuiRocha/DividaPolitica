require 'rails_helper'

RSpec.describe "deputados/index", type: :view do
  before do
    assign(:deputados, [
      create(:deputado, nome: "João Silva", partido: "PT", estado: "SP", ide_cadastro: 123),
      create(:deputado, nome: "Maria Souza", partido: "PSDB", estado: "SP", ide_cadastro: 456)
    ])
    assign(:estado, "SP")
    render
  end

  it "exibe o título correto" do
    expect(rendered).to have_text("Deputados do Estado SP")
  end

  it "exibe a lista de deputados" do
    expect(rendered).to have_text("João Silva")
    expect(rendered).to have_text("Maria Souza")
  end

  it "exibe o formulário de filtros" do
    expect(rendered).to have_selector("form[action='#{deputados_path}'][method='get']")
    expect(rendered).to have_selector("input[name='nome']")
    expect(rendered).to have_selector("select[name='partido']")
    expect(rendered).to have_selector("select[name='ano']")
  end
end
