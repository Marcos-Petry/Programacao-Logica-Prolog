:- set_prolog_flag(encoding, utf8).

% Base de conhecimento com sintomas e problemas associados
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
problema(vazamento_oleo) :- manchas_de_oleo_no_chao, baixo_nivel_de_oleo.
problema(problema_suspensao) :- barulho_ao_dirigir_em_buracos, carro_desalinhado.
problema(filtro_ar_entupido) :- motor_perde_potencia, alto_consumo_de_combustivel.

% Limpa os sintomas antes de iniciar o diagnóstico
limpar_sintomas :-
    retractall(motor_nao_liga),
    retractall(luzes_fracas),
    retractall(barulho_ao_frear),
    retractall(pedal_freio_macio),
    retractall(manchas_de_oleo_no_chao),
    retractall(baixo_nivel_de_oleo),
    retractall(barulho_ao_dirigir_em_buracos),
    retractall(carro_desalinhado),
    retractall(motor_perde_potencia),
    retractall(alto_consumo_de_combustivel).

% Diagnóstico
diagnostico :-
    limpar_sintomas,
    write('Sistema de Diagnóstico de Problemas Veiculares. Responda às perguntas com "s" para sim ou "n" para não.\n'),
    pergunta(motor_nao_liga, 'O motor não liga? (s/n): '),
    pergunta(luzes_fracas, 'As luzes estão fracas? (s/n): '),
    pergunta(barulho_ao_frear, 'Há barulho ao frear? (s/n): '),
    pergunta(pedal_freio_macio, 'O pedal do freio está macio? (s/n): '),
    pergunta(manchas_de_oleo_no_chao, 'Há manchas de óleo no chão? (s/n): '),
    pergunta(baixo_nivel_de_oleo, 'O nível de óleo está baixo? (s/n): '),
    pergunta(barulho_ao_dirigir_em_buracos, 'Há barulho ao dirigir em buracos? (s/n): '),
    pergunta(carro_desalinhado, 'O carro está desalinhado? (s/n): '),
    pergunta(motor_perde_potencia, 'O motor perde potência? (s/n): '),
    pergunta(alto_consumo_de_combustivel, 'O consumo de combustível está alto? (s/n): '),
    diagnostico_resultado.

% Função para perguntar e registrar sintoma com validação de entrada
pergunta(Sintoma, Pergunta) :-
    write(Pergunta),
    nl,
    read_line_to_string(user_input, Resposta),
    validar_resposta(Resposta, Sintoma).

% Valida as respostas do usuário
validar_resposta(Resposta, Sintoma) :-
    (Resposta == "s" -> assert(Sintoma), !;
     Resposta == "n" -> true, !;
     write('Resposta inválida. Por favor, responda apenas com "s" ou "n".\n'),
     pergunta(Sintoma, Pergunta)).

% Exibe o diagnóstico e recomendações
diagnostico_resultado :-
    (problema(Problema) ->
        format('Possível problema identificado: ~w\n', [Problema]),
        recomendacao(Problema);
    write('Não foi possível determinar o problema. Leve o veículo a um mecânico para avaliação.\n')).

% Sugestões de ação com base no problema
recomendacao(bateria_fraca) :-
    write('Sugestão: Verifique a bateria e o alternador. Pode ser necessário recarregar ou trocar a bateria.\n').
recomendacao(freio_desgastado) :-
    write('Sugestão: Inspecione o sistema de freios e substitua as pastilhas ou discos, se necessário.\n').
recomendacao(vazamento_oleo) :-
    write('Sugestão: Verifique se há vazamentos no cárter ou juntas e reabasteça o óleo.\n').
recomendacao(problema_suspensao) :-
    write('Sugestão: Verifique a suspensão e faça o alinhamento do veículo.\n').
recomendacao(filtro_ar_entupido) :-
    write('Sugestão: Substitua o filtro de ar e realize uma manutenção preventiva no motor.\n').
