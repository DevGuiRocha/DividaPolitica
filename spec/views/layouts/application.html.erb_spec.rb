require 'rails_helper'

RSpec.describe "layouts/application", type: :view do
  before do
    flash[:alert] = "Erro ao processar a solicitação!"
    render
  end

  it "renderiza a navbar" do
    expect(rendered).to have_selector("nav.navbar")
    expect(rendered).to have_link("Home", href: root_path)
    expect(rendered).to have_link("Consultar Deputados", href: selecao_estado_path)
    expect(rendered).to have_link("Importar CSV", href: upload_despesas_path)
  end

  it "exibe mensagens flash quando presentes" do
    expect(rendered).to have_selector(".alert.alert-warning", text: "Erro ao processar a solicitação!")
  end

  it "renderiza o footer" do
    expect(rendered).to have_selector("footer.bg-dark")
    expect(rendered).to have_text("Sistema de consulta de Deputados")
  end
end
