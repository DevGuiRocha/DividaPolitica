require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "atribui corretamente as variáveis de contagem e soma" do
      create_list(:deputado, 3)
      create(:despesa, valor_liquido: 100)
      create(:despesa, valor_liquido: 200)

      get :index

      expect(assigns(:total_deputados)).to eq(3)
      expect(assigns(:total_despesas)).to eq(2)
      expect(assigns(:gastos_totais)).to eq(300)
    end 
  end
end