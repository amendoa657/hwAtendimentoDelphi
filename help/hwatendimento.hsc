HelpScribble project file.
16
...
0
2
HW Atendimento - Ajuda


HW Atendimento
FALSE


1
BrowseButtons()
0
FALSE

FALSE
TRUE
16777215
0
16711680
8388736
255
FALSE
FALSE
FALSE
FALSE
150
50
600
500
TRUE
FALSE
1
TRUE
FALSE
Contents
%s Contents
Index
%s Index
Previous
Next
FALSE

13
1
IDH_INTRODUCAO
Bem-vindo ao HW Atendimento
HW Atendimento;introdução;visão geral;sobre o sistema


hwatendimento:010
Imported



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Bem-vindo ao HW \{keepn\} Atendimento
\par \pard\sa120\cf0\b0\fs20 O \b HW Atendimento\b0  registra e organiza os atendimentos t\'e9cnicos feitos nos equipamentos da HW (eletrocardi\'f3grafos e erg\'f4metros). Cada atendimento fica ligado ao equipamento, pelo n\'famero de s\'e9rie, e ao cliente dono dele, formando o hist\'f3rico completo de cada aparelho.
\par \pard\sb200\sa80\cf1\b\fs22 O que voc\'ea pode fazer
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\strike Pesquisar atendimentos\strike0\{linkID=5\} por per\'edodo, cliente, n\'famero de s\'e9rie, descri\'e7\'e3o ou telefone.
\par \bullet\tab\strike Registrar um novo atendimento\strike0\{linkID=6\}, cadastrando cliente e equipamento na mesma tela quando forem novos.
\par \bullet\tab\strike Editar\strike0\{linkID=8\} ou \strike excluir\strike0\{linkID=9\} atendimentos, conforme o seu perfil.
\par \bullet\tab\strike Gerenciar usu\'e1rios\strike0\{linkID=10\} e consultar o \strike log de a\'e7\'f5es\strike0\{linkID=11\} (perfis com permiss\'e3o).
\par \pard\sb200\sa80\cf1\b\fs22 Por onde come\'e7ar
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\strike Entrando no sistema\strike0\{linkID=2\}
\par \bullet\tab\strike Navega\'e7\'e3o entre as telas\strike0\{linkID=3\}
\par \bullet\tab\strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}
\par 
\par }
2
IDH_LOGIN
Entrando no sistema
login;entrar;senha;usuário, login


hwatendimento:020
Imported



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Entrando no \{keepn\} sistema
\par \pard\sa120\cf0\b0\fs20 Ao abrir o programa, a tela de login aparece antes de qualquer outra. Informe o seu \b usu\'e1rio\b0  e a sua \b senha\b0  e clique em \b Entrar\b0  (ou pressione \b Enter\b0 ).
\par \pard\sb200\sa80\cf1\b\fs22 Mensagens do login
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b Informe o usu\'e1rio.\b0  / \b Informe a senha.\b0 : um dos campos ficou em branco.
\par \bullet\tab\b Usu\'e1rio ou senha inv\'e1lidos.\b0 : o usu\'e1rio n\'e3o existe, a senha est\'e1 errada ou o usu\'e1rio est\'e1 desativado. Por seguran\'e7a, a mensagem n\'e3o diz qual dos casos aconteceu.
\par \bullet\tab\b Erro ao conectar\b0 : o programa n\'e3o conseguiu acessar o banco de dados. Verifique se o servidor MySQL est\'e1 ligado e procure o respons\'e1vel pelo sistema.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Se voc\'ea fechar a tela de login sem entrar, o programa \'e9 encerrado. Usu\'e1rios desativados n\'e3o conseguem entrar; pe\'e7a a um administrador para reativar o seu usu\'e1rio em \strike Gerenciar usu\'e1rios\strike0\{linkID=10\}.
\par \pard\sb200\sa80\cf1\b\fs22 Veja tamb\'e9m
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}
\par 
\par }
3
IDH_NAVEGACAO
Navegação entre as telas
navegação;telas;cabeçalho;botões do cabeçalho;voltar


hwatendimento:030
Imported



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Navega\'e7\'e3o entre as \{keepn\} telas
\par \pard\sa120\cf0\b0\fs20 Depois do login, o programa abre na tela de \strike Pesquisar atendimentos\strike0\{linkID=5\}, que \'e9 a tela principal. As outras telas s\'e3o abertas pelos bot\'f5es do cabe\'e7alho (a faixa escura no topo):
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Novo atendimento\b0 : abre a tela de \strike registro\strike0\{linkID=6\}.
\par \bullet\tab\b Pesquisar\b0 : volta para a pesquisa.
\par \bullet\tab\b Usu\'e1rios\b0 : abre a tela de \strike usu\'e1rios\strike0\{linkID=10\}.
\par \bullet\tab\b Log\b0 : abre o \strike log de a\'e7\'f5es\strike0\{linkID=11\}.
\par \pard\sa120 Nas telas secund\'e1rias, o bot\'e3o \b Voltar\b0  e o \b X\b0  da janela levam de volta \'e0 pesquisa. Fechar a tela de pesquisa encerra o programa.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Cada bot\'e3o s\'f3 aparece se o seu perfil tiver permiss\'e3o para usar aquela tela. Se voc\'ea n\'e3o encontra um bot\'e3o, veja \strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}.
\par 
\par }
4
IDH_PERFIS
Perfis de usuário e permissões
perfis;permissões;administrador;suporte;perfil, atendimento;manutenção;auditoria


hwatendimento:040
Imported



FALSE
17
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Perfis de usu\'e1rio e \{keepn\} permiss\'f5es
\par \pard\sa120\cf0\b0\fs20 Todo usu\'e1rio tem um \b perfil\b0 , que define o que ele pode fazer no sistema. Os bot\'f5es que o perfil n\'e3o permite ficam escondidos.
\par \pard\sb200\sa80\cf1\b\fs22 Administrador
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab Registra, edita e exclui qualquer atendimento.
\par \bullet\tab Abre a tela de usu\'e1rios (cadastra, ativa e desativa) e o log.
\par \pard\sb200\sa80\cf1\b\fs22 Suporte, Atendimento e Manuten\'e7\'e3o
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab Registram atendimentos.
\par \bullet\tab Editam \b somente os atendimentos que eles mesmos registraram\b0 .
\par \bullet\tab N\'e3o excluem atendimentos e n\'e3o acessam usu\'e1rios nem log.
\par \pard\sb200\sa80\cf1\b\fs22 Auditoria
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab Consulta tudo: pesquisa, usu\'e1rios e log.
\par \bullet\tab N\'e3o registra, n\'e3o edita e n\'e3o exclui nada.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Todos os perfis podem \b pesquisar\b0  e ver todos os atendimentos. A coluna \b Respons\'e1vel\b0  da pesquisa mostra quem registrou cada um.
\par 
\par }
5
IDH_PESQUISAR
Pesquisar atendimentos
pesquisar;pesquisa;filtros, pesquisa;consultar atendimentos;tela inicial


hwatendimento:050
Imported



FALSE
21
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Pesquisar \{keepn\} atendimentos
\par \pard\sa120\cf0\b0\fs20 A tela de pesquisa \'e9 a tela principal do programa. Ela abre mostrando \b todos os atendimentos\b0 , do mais recente para o mais antigo, e \'e9 atualizada sempre que voc\'ea volta para ela.
\par \pard\sb200\sa80\cf1\b\fs22 Filtros
\par \pard\sa120\cf0\b0\fs20 Preencha s\'f3 os filtros que quiser usar. Filtro em branco \'e9 ignorado.
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b De\b0  / \b At\'e9\b0 : per\'edodo de in\'edcio do atendimento. Marque a caixinha do campo para usar a data; desmarcada, o filtro \'e9 ignorado. O "At\'e9" inclui o dia inteiro.
\par \bullet\tab\b Nome do cliente\b0 : aceita parte do nome (por exemplo, "silva" encontra "Maria Silva").
\par \bullet\tab\b N\'famero de s\'e9rie\b0 : o n\'famero completo do equipamento.
\par \bullet\tab\b Descri\'e7\'e3o cont\'e9m\b0 : uma palavra ou trecho da descri\'e7\'e3o.
\par \bullet\tab\b Telefone\b0 : o telefone do cliente, ou parte dele.
\par \pard\sa120 Clique em \b Pesquisar\b0  para aplicar os filtros. \b Limpar filtros\b0  apaga todos os filtros e mostra de novo todos os atendimentos.
\par \pard\sb200\sa80\cf1\b\fs22 Resultados
\par \pard\sa120\cf0\b0\fs20 A tabela mostra \b In\'edcio\b0 , \b Modelo\b0 , \b N\'ba de s\'e9rie\b0 , \b Cliente\b0 , \b Telefone\b0 , \b Dura\'e7\'e3o\b0 , \b Respons\'e1vel\b0  e \b Descri\'e7\'e3o\b0 . A dura\'e7\'e3o aparece como \b Em aberto\b0  quando o atendimento ainda n\'e3o tem data de t\'e9rmino.
\par \pard\sb200\sa80\cf1\b\fs22 A\'e7\'f5es sobre um atendimento
\par \pard\sa120\cf0\b0\fs20 Selecione uma linha da tabela e use os bot\'f5es abaixo dela:
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Editar\b0 : veja \strike Editar um atendimento\strike0\{linkID=8\}.
\par \bullet\tab\b Excluir\b0 : veja \strike Excluir um atendimento\strike0\{linkID=9\}.
\par \bullet\tab\b Anexos\b0 : mostra os arquivos anexados ao atendimento. Veja \strike Anexar arquivos\strike0\{linkID=13\}.
\par 
\par }
6
IDH_REGISTRAR
Registrar um novo atendimento
registrar;novo atendimento;cadastrar atendimento;salvar atendimento;histórico do equipamento


hwatendimento:060
Imported



FALSE
22
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Registrar um novo \{keepn\} atendimento
\par \pard\sa120\cf0\b0\fs20 Clique em \b Novo atendimento\b0  no cabe\'e7alho para abrir esta tela. O registro sempre come\'e7a pelo n\'famero de s\'e9rie do equipamento.
\par \pard\sb200\sa80\cf1\b\fs22 1. N\'famero de s\'e9rie
\par \pard\sa120\cf0\b0\fs20 Digite o n\'famero de s\'e9rie (veja \strike N\'famero de s\'e9rie e modelos\strike0\{linkID=7\}) e clique em \b Buscar\b0 . O modelo do equipamento \'e9 identificado automaticamente pelo n\'famero.
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Equipamento j\'e1 cadastrado\b0 : os dados do cliente s\'e3o preenchidos sozinhos e o painel \b Hist\'f3rico do equipamento\b0 , \'e0 direita, mostra os atendimentos anteriores.
\par \bullet\tab\b Equipamento novo\b0 : aparece o aviso em vermelho ao lado do campo. Preencha os dados do cliente; ao salvar, o cliente e o equipamento s\'e3o cadastrados junto com o atendimento.
\par \pard\sb200\sa80\cf1\b\fs22 2. Cliente
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b Pessoa f\'edsica\b0  ou \b Pessoa jur\'eddica\b0 . O campo \b Empresa\b0  s\'f3 \'e9 liberado para pessoa jur\'eddica.
\par \bullet\tab\b Nome\b0  e \b Telefone\b0  do cliente.
\par \pard\sb200\sa80\cf1\b\fs22 3. Atendimento
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b In\'edcio\b0 : data e hora em que o atendimento come\'e7ou.
\par \bullet\tab\b T\'e9rmino\b0 : data e hora em que terminou. Deixe a caixinha da data \b desmarcada\b0  se o atendimento ainda estiver \b em aberto\b0 .
\par \bullet\tab\b Descri\'e7\'e3o\b0 : o que foi verificado e o que foi feito.
\par \pard\sb200\sa80\cf1\b\fs22 4. Salvar
\par \pard\sa120\cf0\b0\fs20 Clique em \b Salvar atendimento\b0 . O sistema confere se o n\'famero de s\'e9rie \'e9 v\'e1lido, se o modelo foi identificado e se o nome do cliente e a descri\'e7\'e3o foram preenchidos. Se estiver tudo certo, aparece \b Atendimento gravado com sucesso!\b0  e a tela \'e9 limpa para um novo registro.
\par O bot\'e3o \b Cancelar\b0  limpa a tela sem gravar nada.
\par Para anexar fotos ou documentos ao atendimento, veja \strike Anexar arquivos\strike0\{linkID=13\}.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 O atendimento fica registrado em seu nome (voc\'ea passa a ser o respons\'e1vel por ele). S\'f3 perfis com permiss\'e3o de registro veem o bot\'e3o Novo atendimento.
\par 
\par }
7
IDH_NUMERO_SERIE
Número de série e modelos
número de série;modelos;ECGV6;ECGV11;Ergo13;ErgoMET13;ErgoCP


hwatendimento:070
Imported



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 N\'famero de s\'e9rie e \{keepn\} modelos
\par \pard\sa120\cf0\b0\fs20 O n\'famero de s\'e9rie tem sempre \b 2 letras seguidas de 9 n\'fameros\b0 , por exemplo \b EC102345671\b0 . As letras s\'e3o convertidas para mai\'fasculas automaticamente.
\par \pard\sb200\sa80\cf1\b\fs22 Como o modelo \'e9 identificado
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b EC10\b0 ... = ECGV6
\par \bullet\tab\b EC11\b0 ... = ECGV11
\par \bullet\tab\b TE\b0 ... = Ergo13
\par \bullet\tab\b TC\b0 ... = ErgoMET13
\par \bullet\tab\b TP\b0 ... = ErgoCP
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Se o n\'famero n\'e3o seguir esse formato, o atendimento n\'e3o pode ser salvo e o sistema mostra a mensagem de n\'famero de s\'e9rie inv\'e1lido.
\par \pard\sb200\sa80\cf1\b\fs22 Veja tamb\'e9m
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\strike Registrar um novo atendimento\strike0\{linkID=6\}
\par 
\par }
8
IDH_EDITAR
Editar um atendimento
editar;alterar atendimento;corrigir atendimento


hwatendimento:080
Imported



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Editar um \{keepn\} atendimento
\par \pard\sa120\cf0\b0\fs20 Na \strike pesquisa\strike0\{linkID=5\}, selecione o atendimento e clique em \b Editar\b0 . Uma janela de edi\'e7\'e3o abre no centro da tela.
\par \pard\sb200\sa80\cf1\b\fs22 O que pode ser alterado
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b In\'edcio\b0  (data e hora).
\par \bullet\tab\b T\'e9rmino\b0  (data e hora). Desmarque a caixinha da data para deixar o atendimento em aberto.
\par \bullet\tab\b Descri\'e7\'e3o\b0 .
\par \pard\sa120 N\'famero de s\'e9rie, modelo, cliente e telefone aparecem s\'f3 para confer\'eancia e n\'e3o podem ser alterados por esta janela.
\par Clique em \b Salvar altera\'e7\'f5es\b0 . A pesquisa \'e9 atualizada com os novos dados. \b Cancelar\b0  (ou o X) fecha a janela sem alterar nada.
\par A se\'e7\'e3o \b Anexos\b0  da janela mostra e gerencia os arquivos do atendimento. Veja \strike Anexar arquivos\strike0\{linkID=13\}.
\par \pard\sb200\sa80\cf1\b\fs22 Regras
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab A descri\'e7\'e3o n\'e3o pode ficar vazia.
\par \bullet\tab O t\'e9rmino n\'e3o pode ser antes do in\'edcio.
\par \bullet\tab Suporte, Atendimento e Manuten\'e7\'e3o s\'f3 editam os atendimentos que registraram. Ao tentar editar o de outra pessoa, aparece \b Voc\'ea s\'f3 pode editar atendimentos registrados por voc\'ea.\b0 
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 O bot\'e3o Editar n\'e3o aparece para o perfil Auditoria. Veja \strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}.
\par 
\par }
9
IDH_EXCLUIR
Excluir um atendimento
excluir;apagar atendimento;remover atendimento


hwatendimento:090
Imported



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Excluir um \{keepn\} atendimento
\par \pard\sa120\cf0\b0\fs20 Na \strike pesquisa\strike0\{linkID=5\}, selecione o atendimento e clique em \b Excluir\b0 . O sistema mostra o cliente e a data do atendimento e pede confirma\'e7\'e3o.
\par Ao confirmar, o atendimento \'e9 apagado e a pesquisa \'e9 atualizada. O cliente e o equipamento continuam cadastrados.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 A exclus\'e3o \b n\'e3o pode ser desfeita\b0 . Ela fica registrada no \strike log\strike0\{linkID=11\}, com quem excluiu e quando. S\'f3 o perfil Administrador v\'ea o bot\'e3o Excluir.
\par 
\par }
10
IDH_USUARIOS
Gerenciar usuários
usuários;cadastrar usuário;novo usuário;ativar usuário;desativar usuário


hwatendimento:100
Imported



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Gerenciar \{keepn\} usu\'e1rios
\par \pard\sa120\cf0\b0\fs20 Clique em \b Usu\'e1rios\b0  no cabe\'e7alho. A tabela \b Cadastrados\b0  mostra o \b Nome\b0 , o \b Perfil\b0 , se est\'e1 \b Ativo\b0  e quando foi \b criado\b0  cada usu\'e1rio.
\par \pard\sb200\sa80\cf1\b\fs22 Cadastrar um usu\'e1rio
\par \pard\sa120\cf0\b0\fs20 No painel \b Novo usu\'e1rio\b0 , \'e0 direita, informe:
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Nome\b0 : o nome usado no login. N\'e3o pode repetir o de outro usu\'e1rio.
\par \bullet\tab\b Senha\b0 : pelo menos 4 caracteres.
\par \bullet\tab\b Perfil\b0 : veja \strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}.
\par \pard\sa120 Clique em \b Cadastrar\b0 . O usu\'e1rio aparece na lista e j\'e1 pode entrar no sistema.
\par \pard\sb200\sa80\cf1\b\fs22 Ativar ou desativar
\par \pard\sa120\cf0\b0\fs20 Selecione o usu\'e1rio na tabela e clique em \b Ativar / Desativar\b0  (o sistema pede confirma\'e7\'e3o). Usu\'e1rios desativados n\'e3o conseguem entrar, mas os atendimentos e o hist\'f3rico deles s\'e3o mantidos.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Voc\'ea n\'e3o pode desativar o seu pr\'f3prio usu\'e1rio. O cadastro e o bot\'e3o Ativar / Desativar s\'f3 aparecem para o Administrador; o perfil Auditoria v\'ea apenas a lista.
\par 
\par }
11
IDH_LOG
Consultar o log de ações
log;histórico de ações;log, auditoria;logins;quem alterou


hwatendimento:110
Imported



FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Consultar o log de \{keepn\} a\'e7\'f5es
\par \pard\sa120\cf0\b0\fs20 O log registra as a\'e7\'f5es feitas no sistema: quem fez, o qu\'ea e quando. Clique em \b Log\b0  no cabe\'e7alho para abrir a consulta. A tela abre mostrando as a\'e7\'f5es mais recentes, \b sem os logins\b0 .
\par \pard\sb200\sa80\cf1\b\fs22 Filtros
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab\b De\b0  / \b At\'e9\b0 : per\'edodo da a\'e7\'e3o. Marque a caixinha para usar a data.
\par \bullet\tab\b Usu\'e1rio\b0 : um usu\'e1rio espec\'edfico ou \b Todos\b0 .
\par \bullet\tab\b A\'e7\'e3o\b0 : \b Criou\b0 , \b Editou\b0 , \b Excluiu\b0  ou \b Todas\b0 .
\par \bullet\tab\b Tabela\b0 : \b Atendimento\b0 , \b Usu\'e1rio\b0 , \b Anexo\b0  ou \b Todas\b0 .
\par \bullet\tab\b Incluir logins\b0 : marque para ver tamb\'e9m as entradas no sistema.
\par \pard\sa120 Clique em \b Pesquisar\b0  para aplicar. \b Limpar filtros\b0  volta tudo ao padr\'e3o e pesquisa de novo.
\par \pard\sb200\sa80\cf1\b\fs22 Colunas
\par \pard\sa120\cf0\fs20 Data\b0 , \b Usu\'e1rio\b0 , \b A\'e7\'e3o\b0 , \b Tabela\b0 , \b Cliente\b0  (quando a a\'e7\'e3o envolve um cliente) e \b Detalhe\b0 , que descreve a a\'e7\'e3o em texto (por exemplo, "Excluiu o atendimento de Maria Souza").
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 O log \'e9 somente leitura. S\'f3 os perfis Administrador e Auditoria veem o bot\'e3o Log.
\par 
\par }
12
IDH_DUVIDAS
Dúvidas frequentes e mensagens
dúvidas;mensagens;erros;problemas


hwatendimento:120
Imported



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 D\'favidas frequentes e \{keepn\} mensagens
\par \pard\sb200\sa80\fs22 N\'e3o encontro um bot\'e3o (Novo atendimento, Editar, Excluir, Usu\'e1rios, Log)
\par \pard\sa120\cf0\b0\fs20 O bot\'e3o est\'e1 escondido porque o seu perfil n\'e3o tem essa permiss\'e3o. Veja \strike Perfis de usu\'e1rio e permiss\'f5es\strike0\{linkID=4\}.
\par \pard\sb200\sa80\cf1\b\fs22 "Pesquise e selecione um atendimento para editar." (ou para excluir)
\par \pard\sa120\cf0\b0\fs20 Nenhum atendimento est\'e1 selecionado na tabela da pesquisa. Fa\'e7a a pesquisa e clique na linha desejada.
\par \pard\sb200\sa80\cf1\b\fs22 "Voc\'ea s\'f3 pode editar atendimentos registrados por voc\'ea."
\par \pard\sa120\cf0\b0\fs20 O seu perfil edita apenas os pr\'f3prios atendimentos. Confira a coluna \b Respons\'e1vel\b0  na pesquisa.
\par \pard\sb200\sa80\cf1\b\fs22 "J\'e1 existe um usu\'e1rio com esse nome."
\par \pard\sa120\cf0\b0\fs20 Escolha outro nome para o novo usu\'e1rio.
\par \pard\sb200\sa80\cf1\b\fs22 "A senha precisa ter pelo menos 4 caracteres."
\par \pard\sa120\cf0\b0\fs20 Informe uma senha mais longa ao cadastrar o usu\'e1rio.
\par \pard\sb200\sa80\cf1\b\fs22 A dura\'e7\'e3o aparece como "Em aberto"
\par \pard\sa120\cf0\b0\fs20 O atendimento ainda n\'e3o tem data de t\'e9rmino. Use \strike Editar\strike0\{linkID=8\} para informar o t\'e9rmino quando ele for conclu\'eddo.
\par \pard\sb200\sa80\cf1\b\fs22 "Erro ao conectar"
\par \pard\sa120\cf0\b0\fs20 O banco de dados n\'e3o est\'e1 acess\'edvel. Verifique se o servidor MySQL est\'e1 ligado e procure o respons\'e1vel pelo sistema.
\par }
13
IDH_ANEXOS
Anexar arquivos
anexos;anexar arquivo;fotos;PDF;abrir anexo;remover anexo


hwatendimento:130
Imported



FALSE
24
{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green51\blue102;\red96\green96\blue96;}
\viewkind4\uc1\pard\sb60\sa120\cf1\b\f0\fs28 Anexar \{keepn\} arquivos
\par \pard\sa120\cf0\b0\fs20 Voc\'ea pode anexar arquivos aos atendimentos, como fotos do equipamento, laudos em PDF ou documentos. Os arquivos ficam guardados no banco de dados, junto com o atendimento.
\par \pard\sb200\sa80\cf1\b\fs22 No registro de um atendimento novo
\par \pard\sa120\cf0\b0\fs20 Depois de buscar o n\'famero de s\'e9rie, use a se\'e7\'e3o \b Anexos\b0 , no fim da tela de \strike registro\strike0\{linkID=6\}:
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Anexar\b0 : escolha o arquivo. Ele entra na lista, mas s\'f3 \'e9 gravado quando voc\'ea salvar o atendimento.
\par \bullet\tab\b Remover anexo\b0 : tira da lista o arquivo selecionado, antes de salvar.
\par \pard\sb200\sa80\cf1\b\fs22 Em um atendimento j\'e1 registrado
\par \pard\sa120\cf0\b0\fs20 Na janela de \strike edi\'e7\'e3o\strike0\{linkID=8\}, a se\'e7\'e3o \b Anexos\b0  mostra os arquivos do atendimento (nome, tamanho, quem anexou e quando):
\par \pard\fi-240\li480\sa60\tx480\bullet\tab\b Anexar\b0 : grava o arquivo na hora.
\par \bullet\tab\b Abrir\b0 : abre o arquivo no programa padr\'e3o do Windows (visualizador de imagens, leitor de PDF etc.).
\par \bullet\tab\b Salvar como\b0 : guarda uma c\'f3pia do arquivo onde voc\'ea escolher.
\par \bullet\tab\b Remover\b0 : apaga o anexo (o sistema pede confirma\'e7\'e3o).
\par \pard\sb200\sa80\cf1\b\fs22 S\'f3 consultar os anexos
\par \pard\sa120\cf0\b0\fs20 Na \strike pesquisa\strike0\{linkID=5\}, selecione o atendimento e clique em \b Anexos\b0 . A janela lista os arquivos e permite \b Abrir\b0  e \b Salvar como\b0 , sem alterar nada. Todos os perfis podem usar, inclusive a Auditoria.
\par \pard\sb200\sa80\cf1\b\fs22 Regras
\par \pard\fi-240\li480\sa60\tx480\cf0\b0\fs20\bullet\tab Cada arquivo pode ter no m\'e1ximo \b 10 MB\b0 .
\par \bullet\tab Programas e scripts (.exe, .bat, .cmd, .msi, .vbs, .js e similares) n\'e3o podem ser anexados, por seguran\'e7a.
\par \bullet\tab Quem pode editar o atendimento pode anexar e remover arquivos dele.
\par \bullet\tab Ao excluir um atendimento, os anexos dele s\'e3o apagados junto.
\par \pard\li240\ri240\sb120\sa120\cf2\b Observa\'e7\'e3o: \b0 Anexar e remover arquivos fica registrado no \strike log\strike0\{linkID=11\} (Tabela: Anexo).
\par 
\par }
1
main="HW Atendimento - Ajuda",,27904,(r16777215),(r15790320),f2
0
0
17
1 Primeiros passos
2 Bem-vindo ao HW Atendimento=IDH_INTRODUCAO
2 Entrando no sistema=IDH_LOGIN
2 Navegação entre as telas=IDH_NAVEGACAO
2 Perfis de usuário e permissões=IDH_PERFIS
1 Atendimentos
2 Pesquisar atendimentos=IDH_PESQUISAR
2 Registrar um novo atendimento=IDH_REGISTRAR
2 Número de série e modelos=IDH_NUMERO_SERIE
2 Editar um atendimento=IDH_EDITAR
2 Excluir um atendimento=IDH_EXCLUIR
2 Anexar arquivos=IDH_ANEXOS
1 Administração
2 Gerenciar usuários=IDH_USUARIOS
2 Consultar o log de ações=IDH_LOG
1 Ajuda
2 Dúvidas frequentes e mensagens=IDH_DUVIDAS
6
*InternetLink
16711680
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-16777208
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-16777208
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*TopicText
-16777208
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
