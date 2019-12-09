# frozen_string_literal: true

Dado("que eu acesse o app Cadastro de Clientes") do
  @incluir = Cadastrar.new
  @alterar = Alterar.new
  @consultar = Consultar.new
  @excluir = Excluir.new
end

Quando("preencher todos os dados de cadastro de novo cliente") do
  @incluir.incluir_dados_cadastro
end

Entao("o app apresentara a mensagem de cadastro efetuado com sucesso") do
  expect(@incluir.valida_texto_alerta_cadastrado).to eql("Cadastro efetuado com sucesso")
end

Quando("alterar dados de um cliente cadastrado") do
  @alterar.alterar_dados_cadastro
end

Entao("o app apresentara a mensagem de cadastro atualizado com sucesso") do
  expect(@alterar.valida_texto_alerta_alterado).to eql("Cadastro atualizado com sucesso")
end

Quando("consultar cliente cadastrado") do
  @consultar.consultar_dados_cadastro
end

Entao("o app apresentara o cliente consultado") do
  expect(@consultar.valida_texto_alerta_alterado).to eql("AMErico Digitoncio")
end

Quando("excluir cliente cadastrado") do
  @excluir.excluir_dados_cadastro
end

Entao("o app apresentara a mensagem de cadastro excluido com sucesso") do
  expect(@excluir.valida_texto_alerta_excluido).to eql("Cadastro excluido com sucesso")
end