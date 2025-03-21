class Despesa < ApplicationRecord
  belongs_to :deputado

  validates :ide_documento, uniqueness: true, presence: true

  #Em vez de fazer a consulta diretamente na view, podemos usar um método no model Despesa
  def self.anos_disponiveis
    select("DISTINCT EXTRACT(YEAR FROM data_emissao) AS ano")
      .where("EXTRACT(YEAR FROM data_emissao) > 2000")
      .map { |d| d.ano.to_i }
      .sort
  end

end
