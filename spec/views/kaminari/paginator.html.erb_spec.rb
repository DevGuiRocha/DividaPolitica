require 'rails_helper'

RSpec.describe "kaminari/paginator", type: :view do
  before do
    paginated_collection = Kaminari.paginate_array((1..50).to_a).page(1).per(10)
    allow(view).to receive(:paginator).and_return(paginated_collection)
    allow(view).to receive(:current_page).and_return(paginated_collection)
    render
  end

  it "exibe a navegação de paginação" do
    expect(rendered).to have_selector("nav ul.pagination")
  end

  it "exibe o botão de próxima página" do
    expect(rendered).to have_link("Próximo", href: /page=2/)
  end

  it "não exibe o botão de página anterior na primeira página" do
    expect(rendered).to have_selector(".page-item.disabled", text: "Anterior")
  end
end
