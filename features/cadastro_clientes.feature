#language: pt
#utf-8

Funcionalidade: Realizar operacoes basicas de cadastro de cliente no App Cadastro de Clientes

Contexto:
    Dado que eu acesse o app Cadastro de Clientes

@cadastro @cadastrar
Cenario: incluir cadastro de cliente 
    Quando preencher todos os dados de cadastro de novo cliente
    Entao o app apresentara a mensagem de cadastro efetuado com sucesso
    
@cadastro @alterar
Cenario: alterar cadastro de cliente
    Quando alterar dados de um cliente cadastrado
    Entao o app apresentara a mensagem de cadastro atualizado com sucesso

@cadastro @consultar
Cenario: consultar cadastro de cliente
    Quando consultar cliente cadastrado 
    Entao o app apresentara o cliente consultado

@cadastro @excluir
Cenario: excluir cadastro de cliente
    Quando excluir cliente cadastrado
    Entao o app apresentara a mensagem de cadastro excluido com sucesso
