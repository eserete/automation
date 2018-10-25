#language: pt

@login
Funcionalidade: realizar login no sistema de Polis
Para validar a autenticação no sistema Polis
Como usuário do sistema
Eu quero logar e validar o acesso de usuário comum.

Contexto: possibilidade de acessar o sistema
Dado que usuário acesse a tela de login do sistema Polis

Esquema do Cenário: Logar com usuário válido
Quando informar um <usuario>
E <senha> válida, clicar no botão log_in
Então o sistema deve permitir a autenticação do usuário
E deve fazer logout do sistema Polis

Exemplos:
 | usuario                                  | senha      |
#| verx.priscilla.martins@br.experian.com   | Serasa@0   |
 | gft.fabio.lima@br.experian.com           | bf8969     |

@login
@wip
Esquema do Cenário: Logar com usuário válido e senha inválida
Quando informar um <usuario> 
E <senha> inválida, clicar no botão log_in
Então o sistema deve exibir uma mensagem de erro

Exemplos:
| usuario                                  | senha      |
| gft.fabio.lima@br.experian.com           | bf8969     |

@login
Esquema do Cenário: Logar com usuário válido com senha inválida
Quando informar um <usuario>
E <senha> inválida, clicar no botão log_in
Então o sistema deve exibir uma mensagem de erro

Exemplos:
| usuario                                  | senha      |
| gft.fabio.lima@br.experian.com           | xxxxx      |