-module (test).
-export([fac/1]).

% Factorial numbers algorithm

fac(0) -> 1;
fac(N) -> N * fac(N - 1).