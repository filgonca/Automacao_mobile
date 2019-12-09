# frozen_string_literal: true

class Cadastrar < BaseScreen
  def initialize
    @botao_opcoes = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView'
    @botao_cadastrar_novo = 'floating_novo'
    @radiobutton_completo = 'rdCompleto'
    @campo_nome = 'editNome'
    @campo_rg = 'editRg'
    @campo_org_emissor = 'editOrgao'
    @campo_cpf = 'editCpf'
    @campo_data_nascimento = 'editData'
    @campo_nome_mae = 'editMae'
    @campo_nome_pai = 'editPai'
    @campo_endereco = 'editEndereco'
    @campo_numero = 'editNumero'
    @campo_bairro = 'editBairro'
    @campo_cep = 'editCep'
    @campo_cidade = 'editCidade'
    @lista_uf = 'text1'
    @campo_naturalidade = 'editNaturalidade'
    @campo_fone_1 = 'editTelefone1'
    @campo_fone_2 = 'editTelefone2'
    @campo_email = 'editEmail'
    @campo_obs = 'editObs'
    @campo_empresa = 'editEmpresa'
    @campo_cargo = 'editCargo'
    @campo_endereco_empresa = 'editEnderecoEmpresa'
    @campo_cep_empresa = 'editCepEmpresa'
    @campo_telefone_empresa = 'editTelefoneEmpresa'
    @campo_data_admissao = 'editDataAdmissao'
    @campo_renda = 'editRenda'
    @campo_fone_ref_1 = 'editTelefoneRef1'
    @campo_fone_ref_2 = 'editTelefoneRef2'
    @campo_banco = 'editBanco'
    @campo_agencia = 'editAgencia'
    @campo_conta = 'editConta'
    @botao_salvar = 'btnSalvar'
    @alerta_cadastrado = 'message'
  end

  def incluir_dados_cadastro
    find_element(xpath: @botao_opcoes).click
    find_element(id: @botao_cadastrar_novo).click
    find_element(id: @radiobutton_completo).click
    digita_valor(@campo_nome, :campo_nome)
    digita_valor(@campo_rg, :campo_rg)
    digita_valor(@campo_org_emissor, :campo_org_emissor)
    digita_valor(@campo_cpf, :campo_cpf)
    digita_valor(@campo_data_nascimento, :campo_data_nascimento)
    digita_valor(@campo_nome_mae, :campo_nome_mae)
    digita_valor(@campo_nome_pai, :campo_nome_pai)
    digita_valor(@campo_endereco, :campo_endereco)
    digita_valor(@campo_numero, :campo_numero)
    digita_valor(@campo_bairro, :campo_bairro)
    digita_valor(@campo_cep, :campo_cep)
    digita_valor(@campo_cidade, :campo_cidade)
    find_element(id: @lista_uf).click
    find_elements(class: "android.widget.TextView").text(CREDENCIAL[:lista_uf]).click
    digita_valor(@campo_naturalidade, :campo_naturalidade)
    digita_valor(@campo_fone_1, :campo_fone_1)
    digita_valor(@campo_fone_2, :campo_fone_2)
    digita_valor(@campo_email, :campo_email)
    digita_valor(@campo_obs, :campo_obs)
    digita_valor(@campo_empresa, :campo_empresa)
    digita_valor(@campo_cargo, :campo_cargo)
    digita_valor(@campo_endereco_empresa, :campo_endereco_empresa)
    digita_valor(@campo_cep_empresa, :campo_cep_empresa)
    digita_valor(@campo_telefone_empresa, :campo_telefone_empresa)
    digita_valor(@campo_data_admissao, :campo_data_admissao)
    digita_valor(@campo_renda, :campo_renda)
    digita_valor(@campo_fone_ref_1, :campo_fone_ref_1)
    digita_valor(@campo_fone_ref_2, :campo_fone_ref_2)
    digita_valor(@campo_banco, :campo_banco)
    digita_valor(@campo_agencia, :campo_agencia)
    digita_valor(@campo_conta, :campo_conta)
    find_element(id: @botao_salvar).click
  end

  def valida_texto_alerta_cadastrado
    get_element_text(id: @alerta_cadastrado).text
  end
end
