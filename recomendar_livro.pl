:- set_prolog_flag(encoding, utf8).

% Base de conhecimento com livros, gêneros e interesses associados
% Cada livro está associado a um gênero e a um ou mais interesses
recomendar('1984', 'George Orwell', 'Uma distopia clássica sobre um regime totalitário.') :-
    genero(ficcao), interesse(politica).

recomendar('Sapiens', 'Yuval Noah Harari', 'Uma visão fascinante da história da humanidade.') :-
    genero(historia), interesse(ciencia).

recomendar('O Alquimista', 'Paulo Coelho', 'Uma história sobre seguir seus sonhos e buscar sua lenda pessoal.') :-
    genero(ficcao), interesse(autoajuda).

recomendar('O Poder do Hábito', 'Charles Duhigg', 'Um guia sobre como os hábitos moldam nossas vidas e como mudá-los.') :-
    genero(autoajuda), interesse(psicologia).

recomendar('Breves Respostas para Grandes Questões', 'Stephen Hawking', 'Explorações acessíveis sobre os mistérios do universo.') :-
    genero(ciencia), interesse(filosofia).

recomendar('A Arte da Guerra', 'Sun Tzu', 'Uma obra clássica sobre estratégia e tática.') :-
    genero(historia), interesse(estrategia).

% Limpa os gêneros e interesses antes de iniciar a recomendação
limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).

% Recomendação principal
recomendacao :-
    limpar_preferencias,
    write('Sistema de Recomendação de Livros. Responda às perguntas com "s" para sim ou "n" para não.\n'),
    selecionar_generos,
    selecionar_interesses,
    gerar_recomendacoes.

% Selecionar gêneros literários
selecionar_generos :-
    write('Escolha os gêneros literários que você gosta (responda "s" para sim ou "n" para não).\n'),
    pergunta_genero(ficcao, 'Você gosta de Ficção? (s/n): '),
    pergunta_genero(historia, 'Você gosta de História? (s/n): '),
    pergunta_genero(ciencia, 'Você gosta de Ciência? (s/n): '),
    pergunta_genero(autoajuda, 'Você gosta de Autoajuda? (s/n): ').

% Selecionar interesses temáticos
selecionar_interesses :-
    write('Escolha os temas que despertam seu interesse (responda "s" para sim ou "n" para não).\n'),
    pergunta_interesse(politica, 'Você tem interesse por Política? (s/n): '),
    pergunta_interesse(psicologia, 'Você tem interesse por Psicologia? (s/n): '),
    pergunta_interesse(filosofia, 'Você tem interesse por Filosofia? (s/n): '),
    pergunta_interesse(estrategia, 'Você tem interesse por Estratégia? (s/n): ').

% Pergunta e registra gênero
pergunta_genero(Genero, Pergunta) :-
    write(Pergunta),
    read_line_to_string(user_input, Resposta),
    validar_resposta_genero(Resposta, Genero).

% Pergunta e registra interesse
pergunta_interesse(Interesse, Pergunta) :-
    write(Pergunta),
    read_line_to_string(user_input, Resposta),
    validar_resposta_interesse(Resposta, Interesse).

% Valida resposta para gênero
validar_resposta_genero("s", Genero) :- 
    assert(genero(Genero)), !.
validar_resposta_genero("n", _) :- 
    true, !.
validar_resposta_genero(_, Genero) :-
    write('Resposta inválida. Por favor, responda apenas com "s" ou "n".\n'),
    pergunta_genero(Genero, _).

% Valida resposta para interesse
validar_resposta_interesse("s", Interesse) :- 
    assert(interesse(Interesse)), !.
validar_resposta_interesse("n", _) :- 
    true, !.
validar_resposta_interesse(_, Interesse) :-
    write('Resposta inválida. Por favor, responda apenas com "s" ou "n".\n'),
    pergunta_interesse(Interesse, _).

% Gera recomendações com base nas preferências do usuário
gerar_recomendacoes :-
    findall((Titulo, Autor, Sinopse), recomendar(Titulo, Autor, Sinopse), Lista),
    ( Lista \= [] ->
        imprimir_recomendacoes(Lista)
    ;
        write('Não foi possível encontrar livros com as preferências informadas.\n')
    ).

% Imprime cada recomendação encontrada
imprimir_recomendacoes([]).
imprimir_recomendacoes([(Titulo, Autor, Sinopse)|T]) :-
    format('Recomendação: "~w" por ~w.\nSinopse: ~w\n\n', [Titulo, Autor, Sinopse]),
    imprimir_recomendacoes(T).
