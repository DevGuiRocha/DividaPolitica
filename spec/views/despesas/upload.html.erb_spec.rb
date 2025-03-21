require 'rails_helper'

RSpec.describe "despesas/upload", type: :view do
  before do
    render
  end

  it "exibe o título da página" do
    expect(rendered).to have_text("Importar despesas")
  end

  it "exibe o formulário de upload" do
    expect(rendered).to have_selector("form[action='#{import_despesas_path}'][method='post'][enctype='multipart/form-data']")
  end

  it "exibe o campo de seleção de arquivo" do
    expect(rendered).to have_selector("input[type='file'][name='arquivo'][accept='.csv']")
  end

  it "exibe o botão de importação" do
    expect(rendered).to have_button("Importar")
  end

  it "exibe o botão de voltar para o início" do
    expect(rendered).to have_link("Início", href: root_path)
  end
end
