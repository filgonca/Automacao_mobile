# frozen_string_literal: true

class Alterar < BaseScreen
  def initialize
    @radiobutton_completo = 'rdCompleto'
    @campo_nome_mae = 'editMae'
    @campo_nome_pai = 'editPai'
    @botao_salvar = 'btnSalvar'
    @alerta_cadastrado = 'message'
  end

  def alterar_dados_cadastro
    find_elements(class: "android.widget.TextView").text(CREDENCIAL[:campo_nome]).click
    find_element(id: @radiobutton_completo).click
    digita_valor(@campo_nome_mae, :campo_nome_mae_completo)
    digita_valor(@campo_nome_pai, :campo_nome_pai_completo)
    find_element(id: @botao_salvar).click
  end

  def valida_texto_alerta_alterado
    get_element_text(id: @alerta_cadastrado).text
  end
end
