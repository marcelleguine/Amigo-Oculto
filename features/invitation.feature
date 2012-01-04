# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010
Funcionalidade: Teste de convite

    Cenário: Apenas o admin pode enviar convites
         Dado que eu estou logado com "abc@gmail.com" e senha "123456"
         Dado que eu esteja na página de visualização do grupo "1"        
         E eu preencho "Email" com "def@gmail.com"
         Então eu aperto "Enviar"
         Então devo ver "O convite foi enviado!"


         
