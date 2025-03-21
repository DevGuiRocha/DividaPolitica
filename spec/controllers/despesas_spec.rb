require 'rails_helper'

RSpec.describe DespesasController, type: :controller do
  describe "GET #upload" do
    it "responde com sucesso" do
      get :upload
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #import" do
    context "com arquivo CSV válido" do
      it "redireciona para a página inicial com mensagem de sucesso" do
        file = fixture_file_upload("spec/fixtures/despesas_validas.csv", "text/csv")
        service = instance_double(DespesaImportService, processar: { sucesso: 10, erros: 0 })

        allow(DespesaImportService).to receive(:new).and_return(service)

        post :import, params: { arquivo: file }

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Importação concluída!! 10 registros importados. 0 erros.")
      end
    end

    context "sem arquivo enviado" do
      it "redireciona para upload com mensagem de erro" do
        post :import
        expect(response).to redirect_to(upload_despesas_path)
        expect(flash[:alert]).to eq("Por gentileza, selecione um arquivo CSV!!")
      end
    end
  end
end