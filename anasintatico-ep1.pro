analisador_sintatico([=|Ts]) :- expressao(_, Ts, []).

expressao(X) --> fator(X).
expressao(X) --> parcela(X).
expressao(soma(P, T)) --> parcela(P), termos_soma(T).
expressao(sub(P, T)) --> parcela(P), termos_sub(T).
termos_soma(X) --> [+], expressao(X).
termos_sub(X) --> [-], expressao(X).

parcela(X) --> fator(X).
parcela(X) --> ['('], expressao(X), [')'].
parcela(mult(F, T)) --> fator(F), termos_mult(T).
parcela(divi(F, T)) --> fator(F), termos_div(T).
termos_mult(X) --> [*], parcela(X).
termos_div(X) --> [/], parcela(X).

fator(X) --> numero(X).
fator(X) --> posicao(X).

numero(X) --> [int(X)].

posicao(pos(X)) --> [pos(X)].
