:- set_prolog_flag(encoding, utf8).

% Base de conhecimento com sintomas e doenças associadas
doenca(gripe) :- febre, tosse, cansaco.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
doenca(enxaqueca) :- dor_de_cabeca, nauseas, sensibilidade_a_luz.
doenca(sinusite) :- dor_de_cabeca, congestao_nasal, dor_de_garganta.

% Limpa os sintomas antes de iniciar o diagnóstico
limpar_sintomas :- 
    retractall(febre),
    retractall(tosse),
    retractall(cansaco),
    retractall(dor_de_garganta),
    retractall(dor_muscular),
    retractall(dor_de_cabeca),
    retractall(nauseas),
    retractall(sensibilidade_a_luz),
    retractall(congestao_nasal).

% Diagnóstico
diagnostico :- 
    limpar_sintomas,
    write('Sistema de Diagnóstico Médico. Responda às perguntas com "s" para sim ou "n" para não.\n'),
    pergunta(febre, 'Você está com febre? (s/n): '),
    pergunta(tosse, 'Você está com tosse? (s/n): '),
    pergunta(cansaco, 'Você está com cansaço? (s/n): '),
    pergunta(dor_de_garganta, 'Você está com dor de garganta? (s/n): '),
    pergunta(dor_muscular, 'Você está com dor muscular? (s/n): '),
    pergunta(dor_de_cabeca, 'Você está com dor de cabeça? (s/n): '),
    pergunta(nauseas, 'Você está com náuseas? (s/n): '),
    pergunta(sensibilidade_a_luz, 'Você está com sensibilidade à luz? (s/n): '),
    pergunta(congestao_nasal, 'Você está com congestão nasal? (s/n): '),
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
    (doenca(Doenca) -> 
        format('Possível diagnóstico: ~w\n', [Doenca]),
        recomendacao(Doenca);
    write('Não foi possível determinar uma condição específica. Consulte um médico.\n')).

% Sugestões de ação com base no diagnóstico
recomendacao(gripe) :-
    write('Sugestão: Repouso, hidratação e uso de medicamentos para febre. Consulte um médico se necessário.\n').
recomendacao(infeccao_viral) :-
    write('Sugestão: Beber líquidos e consultar um médico para confirmação do diagnóstico.\n').
recomendacao(enxaqueca) :-
    write('Sugestão: Evitar luz intensa e barulho, além de descansar. Consulte um médico se necessário.\n').
recomendacao(sinusite) :-
    write('Sugestão: Consultar um médico, pode ser necessário o uso de antibióticos.\n').