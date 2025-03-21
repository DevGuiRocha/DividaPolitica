require 'rails_helper'

RSpec.describe "deputados/selecao_estado", type: :view do
  before do
    assign(:estados, ["SP", "RJ", "MG"])
    render
  end

  it "exibe o título corretamente" do
    expect(rendered).to have_text("Selecione um Estado para continuar")
  end

  it "exibe o formulário de seleção de estado" do
    expect(rendered).to have_selector("form[action='#{deputados_path}'][method='get']")
    expect(rendered).to have_selector("select[name='estado']")
  end
end
