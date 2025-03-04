## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala.
  new_X = zeros (m, n);
  
  % cast photo la double.
  
  photo = double(photo);
  
  % calculam media fiecarui rand al matricii si
  % normalizam matricea initiala scazand din ea media fiecarui rand.
  
  miu = zeros(m, 1);
  for i = 1:m
    miu(i, 1) = sum(photo(i, :)) / n;
    photo(i, :) = photo(i, :) - miu(i, 1);
  endfor
  
  % calculam matricea de covarianta.
  
  Z = (photo * photo') / (n - 1);
  
  % calculam vectorii si valorile proprii ale matricei de covarianta.
  
  [V, S] = eig(Z);
  
  % ordonam descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  
  [S, i] = sort(diag(S), 'descend');
  V = V(:, i);
  
  % pastram doar primele pcs coloane
  
  W = V(:, 1:pcs);
  
  % creeam matricea Y schimband baza matricii initiale.
  
  Y = W' * photo;
  
  % calculam matricea new_X care este o aproximatie a matricii initiale
  
  new_X = W * Y;
  
  % adunam media randurilor scazuta anterior.
  
  new_X = new_X + miu;

  % transformam matricea in uint8 pentru a fi o imagine valida.
  
  new_X = uint8(new_X);
endfunction
