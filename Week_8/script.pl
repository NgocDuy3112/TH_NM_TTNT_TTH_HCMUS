jugY(Y, Vy, Yc) :- (   Y =:= 0
            ->  Yc is Vy; % Yc is the new volume of jug Y
                Yc is Y
            ).

jugX(X, Vx, Xc) :- (   X =:= Vx
            ->  Xc is 0; % Xc is the new volume of jug X
                Xc is X
            ).

pouring(Y, X, Vx, K, Xc, Yc) :- (   Y =\= 0, X < Vx
                                ->  K is min(Y, Vx - X)
                                ,	Xc is X + K
                                ,	Yc is Y - K
                                ).

do(Vy, Vx, Y, X, Yc, Xc, K) :-
    jugY(Y, Vy, Yc);
    jugX(X, Vx, Xc);
    pouring(Yc, Xc, Vx, K, Xc, Yc).

loop(Vy, Vx, Y, X, Z, Yc, Xc, K) :-
    (   X =\= Z, Y =\= Z
        ->  jugY(Y, Vy, Yc),
	    jugX(X, Vx, Xc),
            pouring(Yc, Xc, Vx, K, Xc, Yc),
            loop(Vy, Vx, Y, X, Z, Yc, Xc, K)
    ).




