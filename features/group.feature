#coding: utf-8
# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010

Funcionalidade: Validar Grupo
  Testar o cadastro de grupo
    
  @javascript

  Cenário: Criação de grupos com usuario logado
    Dado que eu estou logado com "abc@gmail.com" e senha "123456"
    Dado que eu estou na pagina principal
    Quando eu clico "Criar grupo"
    Então eu devo estar na pagina de criação de grupo
    E eu preencho "Nome" com "Infomarka"
    E eu preencho "Descrição" com "O amigo oculto da Infomarka"
    Quando eu aperto "Enviar"
    Então eu devo estar na pagina principal
    E eu devo ver "Infomarka"

 Cenário: Edição de grupos com usuario logado
    Dado que eu estou logado com "abc@gmail.com" e senha "123456"
    Dado que eu estou na pagina principal
    Quando eu clico "Editar"
    Então eu estou na pagina de edição de grupo "1"
    E eu preencho "Nome" com "Computação"
    E eu preencho "Descrição" com "O amigo oculto da Computação"
    Quando eu aperto "Enviar"
    Então eu devo estar na pagina principal
    E eu devo ver "Computação"
 
 Cenário: Remoção de grupos com usuario logado
    Dado que eu estou logado com "abc@gmail.com" e senha "123456"
    Dado que eu estou na pagina principal
    E eu devo ver "Teste"
    Quando eu aperto "Deletar"
    Então eu devo estar na pagina principal
    E eu não devo ver "Teste"

Cenário: Nao e possivel criar grupo sem usuario logado
    Dado que eu estou na pagina principal
    Então eu não devo ver "Criar grupo"

Cenário: Nao e possivel editar grupo sem usuario logado
    Dado que eu estou na pagina principal
    Então eu não devo ver "Editar"

Cenário: Edição de grupos com usuario logado
    Dado que eu estou logado com "def@gmail.com" e senha "123456"
    Dado que eu esteja na pagina de edição de grupo "1"
    Então eu devo estar na pagina principal