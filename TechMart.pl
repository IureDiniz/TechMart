% TechMart
:- dynamic usuario_em_vigor/1, gostar/2.

% gostar(conta, categorias).
gostar(maria, celular).
gostar(joao, automacao_residencial).

% define qual usuario será utilizado para fazer as consultas
usuario_em_vigor(ninguem).

% menu onde é possivel escolher qual usuario será escolhido
inicio :- format('\nEntrar com qual conta?\n1 - Maria\n2 - João\n'),
    	  read(Usuario),
    	  retract(usuario_em_vigor(_)),
    	  asserta(usuario_em_vigor(Usuario)).
		   
% Cria uma lista de todos os produtos gostados pelo usuario
produtos_gostados_por_usuario(User, Produtos) :- findall((Nome, Marca, Preco, Categ), 
            									 (produto(Nome, Marca, Preco, Categ), 
            									 gostar(User, Categ)), 
            									 Produtos).

% Exibe uma lista de produtos de forma recursiva
exibir_produtos([]).
exibir_produtos([(Nome, Marca, Preco, Categ)|Tail]) :- format('~w(~w): R$~w - ~w\n', [Nome, Marca, Preco, Categ]),
    												   exibir_produtos(Tail).

% menu_inicial(usuario_em_vigor).
menu_inicial :- usuario_em_vigor(Usuario),
				produtos_gostados_por_usuario(Usuario, Produtos),
				exibir_produtos(Produtos).


% adiciona um gosto do usuario em vigor
adicionar_gostos :- usuario_em_vigor(Usuario),
    				gostar(Usuario, Antigo_gosto),
    			    format("\nNovo gosto: "),
    			    read(Novo_gosto),
				    assertz(gostar(Usuario, Novo_gosto)).

% remove um gosto do usuario em vigor
remover_gostos :- usuario_em_vigor(Usuario),
    			  format("\nGosto a ser removido: "),
                  read(Gosto),
                  retract(gostar(Usuario, Gosto)).

                                       


% Produto(nome, marca, preço, categoria).
produto(laptop, dell, 1200, computacao_pessoal).
produto(iPhone_15, apple, 1000, celular).
produto(tablet, samsung, 600, tablets).
produto(impressora, hp, 200, periferico).
produto(smartwatch, garmin, 250, acessorio).
produto(fone_ouvido, sony, 150, audio).
produto(tv, lg, 800, audio_visual).
produto(console_video_game, sony, 500, entretenimento).
produto(camera_digital, canon, 700, fotografia).
produto(e_leitor, amazon, 120, leitura).
produto(projetor, epson, 450, audio_visual).
produto(disco_externo, seagate, 100, armazenamento).
produto(roteador, tp_link, 80, rede).
produto(modem, motorola, 70, rede).
produto(monitor, asus, 200, periferico).
produto(teclado, logitech, 50, periferico).
produto(mouse, razer, 60, periferico).
produto(backup_online, google_drive, 100, servico).
produto(impressora_3d, creality, 300, impressao_3d).
produto(drone, dji, 1000, fotografia_aerea).
produto(lampada_inteligente, philips_hue, 40, automacao_residencial).
produto(termostato_inteligente, nest, 250, automacao_residencial).
produto(fechadura_eletronica, august, 150, seguranca_residencial).
produto(camera_seguranca, ring, 200, seguranca_residencial).
produto(tomada_inteligente, tp_link, 30, automacao_residencial).
produto(aspirador_automatico, irobot, 400, automacao_residencial).
produto(cortina_motorizada, soma, 100, automacao_residencial).
produto(galaxy_A06, samsung, 800, celular).
produto(redmi_14C, xiaomi, 700, celular).
produto(psmart_2021, huawei, 900, celular).
produto(nord_n1000, oneplus, 650, celular).
produto(moto_G6_plus, motorola, 750, celular).
produto(nokia_asha, nokia, 500, celular).
produto(ipad_pro, apple, 1100, tablets).
produto(surface_pro, microsoft, 1300, tablets).
produto(matepad_pro, huawei, 900, tablets).
produto(galaxy_tab_s7, samsung, 850, tablets).
produto(lenovo_tab_p11, lenovo, 500, tablets).
produto(camera_externa, arlo, 250, seguranca_residencial).
produto(sistema_alarme, simplisafe, 300, seguranca_residencial).
produto(deteccao_fumaca, nest_protect, 120, seguranca_residencial).
produto(sistema_cftv, hikvision, 450, seguranca_residencial).


% LISTA DE COMANDOS DE PESQUISA
% inicio, menu_inicial(_).
% inicio, menu_inicial(_), adicionar_gostos, menu_inicial(_), remover_gostos, menu_inicial(_).
