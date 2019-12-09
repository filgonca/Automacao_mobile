# frozen_string_literal: true

class Excluir < BaseScreen
  def initialize
    @botao_excluir = 'btnExcluir'
    @botao_sim_alerta = 'button1'
    @campo_pesquisar = 'editPesquisar'
  end

  def excluir_dados_cadastro
    find_elements(class: "android.widget.TextView").text(CREDENCIAL[:campo_nome]).click
    find_element(id: @botao_excluir).click
    find_element(id: @botao_sim_alerta).click
  end

  def valida_texto_alerta_excluido
    @nome_lista = find_element(:xpath, %(//*[contains(@text, "AMErico")]))
    if @nome_lista.displayed? == false
      p "Cadastro excluido com sucesso"
    end
  end
end
