# frozen_string_literal: true

class Consultar < BaseScreen
  def initialize
    @campo_pesquisar = 'editPesquisar'
    @nome_lista_pesquisa = 'nomeLista'
  end

  def consultar_dados_cadastro
    find_element(id: @campo_pesquisar).send_keys CREDENCIAL[:campo_nome]
  end

  def valida_texto_alerta_alterado
    find_elements(class: "android.widget.TextView")[1].text
  end
end
