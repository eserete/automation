#language: pt

@login
@wip
Esquema do Cenário: Logar com usuário válido e senha inválida
Quando informar um <usuario> 
E <senha> inválida, clicar no botão log_in
Então o sistema deve exibir uma mensagem de erro

Exemplos:
| usuario                                  | senha      |
| gft.fabio.lima@br.experian.com           | bf8969     |
