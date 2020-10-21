% Compute Connway's game of life
% https://leetcode.com/problems/game-of-life/
-module(life).
-export([life/0]).

% Neighbour: Can be horizontal, vertical and diagonal.
% Alive neighbours are represented by 1
% Dead neighbours are represented by 0

life() -> 
    % Initialize an example grid
    World = [{0,1,0},{0,0,1},{1,1,1},{0,0,0}],

    % Writing the example grid
    io:fwrite("~w~n", [World]).

% A dead cell with three living neighbours becomes alive

% A living cell with two or three living neighbours remains alive

% In all other cases, the cell becomes (or remains) dead.