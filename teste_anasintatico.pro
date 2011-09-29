% Bateria de testes
expressao(Y, [int(1), +, int(2)], []).

expressao(Y, [int(1), *, int(2)], []).

expressao(Y, ['(', int(1), +, int(2), ')'], []).

expressao(Y, [int(1), +, int(2), +, int(2)], []).

expressao(Y, [int(1), *, int(2), *, int(2)], []).

expressao(Y, [int(1), +, int(2), *, int(3)], []).

expressao(Y, [int(1), *, int(2), +, int(3)], []).

expressao(Y, [int(3), +, int(10), /, int(1), +, int(2)], []).

expressao(Y, [int(3), +, int(10), /, pos(1), +, pos(2)], []).

expressao(Y, [int(10), /, '(', pos(1), +, pos(2), ')'], []).

expressao(Y, [int(3), +, int(10), /, '(', pos(1), +, pos(2), ')'], []).

%analisador_sintatico([=, int(3), +, int(10), /, '(', pos(1), +, pos(2), ')']).
