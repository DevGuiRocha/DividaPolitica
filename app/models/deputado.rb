class Deputado < ApplicationRecord
  has_many :despesas, dependent: :destroy

  validates :ide_cadastro, uniqueness: true, presence: true, numericality: { only_integer: true }
  validates :nome, presence: true
  
  extend EnumerateIt
  has_enumeration_for :partido, with: PartidoEnum
  
  def self.lista_partidos
    PartidoEnum.list
  end
end
