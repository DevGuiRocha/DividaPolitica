require 'rails_helper'

RSpec.describe DeputadosController, type: :controller do
  let!(:deputado) { create(:deputado, nome: "João Silva", estado: "SP", partido: "XYZ") }
  let!(:despesa) { create(:despesa, deputado: deputado, valor_liquido: 500) }

  describe "GET #index" do
    context "quando um estado é fornecido" do
      it "retorna deputados filtrados corretamente" do
        get :index, params: { estado: "SP" }
        expect(assigns(:deputados)).to include(deputado)
      end
    end

    context "quando nenhum estado é fornecido" do
      it "redireciona para a página inicial com alerta" do
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Por favor, selecione um estado para continuar.")
      end
    end
  end

  describe "GET #show" do
    it "atribui corretamente as despesas do deputado" do
      get :show, params: { id: deputado.id }
      expect(assigns(:deputado)).to eq(deputado)
      expect(assigns(:despesas)).to include(despesa)
    end
  end
end