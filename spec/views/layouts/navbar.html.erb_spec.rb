require 'rails_helper'

RSpec.describe "layouts/navbar", type: :view do
  before do
    render
  end

  it "exibe a logo e nome do sistema" do
    expect(rendered).to have_selector("a.navbar-brand")
    expect(rendered).to have_text("Sistema Político")
  end

  it "exibe os links de navegação" do
    expect(rendered).to have_link("Home", href: root_path)
    expect(rendered).to have_link("Consultar Deputados", href: selecao_estado_path)
    expect(rendered).to have_link("Importar CSV", href: upload_despesas_path)
  end
end
