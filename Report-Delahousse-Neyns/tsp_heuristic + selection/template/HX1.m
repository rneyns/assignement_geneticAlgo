%function to implement the heuristic crossover operator
%------------------------------------------------------
%
%This function takes the selected parents as input and applies crossover
%between 2 parents by applying the HX1_intermediate function
%
%OldChrom = the selected chromosomes
%
%
% KULeuven, november 2019 
%
% Input parameters:
%    OldChrom  - Matrix containing the chromosomes of the old
%                population. Each line corresponds to one individual
%                (in any form, not necessarily real values).
%    XOVR      - Probability of recombination occurring between pairs
%                of individuals.
%    Dist      - The distance matrix
%
% Output parameter:
%    NewChrom  - Matrix containing the chromosomes of the population
%                after mating, ready to be mutated and/or evaluated,
%                in the same format as OldChrom.

function NewChrom = HX1(OldChrom, XOVR,Dist)

if nargin < 2, XOVR = NaN; end
   
[rows,~]=size(OldChrom); % oldChrom = matrix with all the individuals
   
   maxrows=rows;
   if rem(rows,2)~=0
	   maxrows=maxrows-1;
   end
   
   for row=1:2:maxrows
     	% crossover of the two chromosomes
   	% results in 2 offsprings
	if rand<XOVR			% recombine with a given probability
        NewChrom(row,:) = HX1_intermediate(OldChrom(row,:),OldChrom(row+1,:),Dist);
		NewChrom(row+1,:) = HX1_intermediate(OldChrom(row,:),OldChrom(row+1,:),Dist);
	else
		NewChrom(row,:)=OldChrom(row,:);
		NewChrom(row+1,:)=OldChrom(row+1,:);
	end
   end

   if rem(rows,2)~=0
	   NewChrom(rows,:)=OldChrom(rows,:);
   end