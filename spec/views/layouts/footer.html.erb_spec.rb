require 'rails_helper'

RSpec.describe "layouts/footer", type: :view do
  before do
    render
  end

  it "exibe o copyright corretamente" do
    expect(rendered).to have_text("© #{Time.now.year} Sistema de consulta de Deputados")
  end

  it "exibe o link de contato" do
    expect(rendered).to have_link("Contato", href: "https://www.linkedin.com/in/guilherme-rocha-828701b6/")
  end
end
