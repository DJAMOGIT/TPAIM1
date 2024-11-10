% 1)if x is an element of the list
cherche(X, [X|_]).
cherche(X, [_|list]) :-cherche(X,list).

% 2) if E is the first element of L.

first(E,[E|_]).

% 3) finds the last element of a list L.
last(X, [X]).
last(X, [_|Tail]) :- last(X, Tail).

% 4)finds the penultimate (second-to-last)element of a list L.

penultimate(X, [X,_]).
penultimate(X, [_|Tail]) :- penultimate(X, Tail).

%5) removes the Kth element from a list L1 and writes the result into a list L2

del_k(X, [X|Tail], 1, Tail).
del_k(X, [Head|Tail], K, [Head|ResultTail]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, Tail, K1, ResultTail).

% 6) calculates lits length N

lengthlist([], 0).
lengthlist([_|Tail], N) :-
    length(Tail, N1),
    N is N1 + 1.

% 7)if L has an even number of elements
even(L) :-
    length(L, N),
    0 is N mod 2.

% 8)concatenating L1 and L2 (without using append).

concat([], L2, L2).
concat([Head|Tail1], L2, [Head|Tail3]) :-
    concat(Tail1, L2, Tail3).

% 9) if the list L is its own reversed image .

palindrome(L) :-
    reverse(L, L).


