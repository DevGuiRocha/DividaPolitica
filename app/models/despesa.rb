class Despesa < ApplicationRecord
  belongs_to :deputado

  validates :ide_documento, uniqueness: true, presence: true

  def self.exercicios_disponiveis
    select("DISTINCT EXTRACT(YEAR FROM data_emissao) AS ano")
    .where("EXTRACT(YEAR FROM data_emissao) > 2000")
    .map { |d| d.ano.to_i }
    .sort
  end  
end
