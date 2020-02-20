% reciprocal exchange : N-random cities in a tour are swapped
%
% Representation is an integer specifying which encoding is used
%	1 : adjacency representation
%	2 : path representation
%

function NewChrom = HMO(OldChrom,Dist)

city1 = randi(length(OldChrom));
Dist_short = Dist(city1,:);
Dist_short(city1) = NaN;
[~, city2] = min(Dist_short);

pointer1 = find(OldChrom == city1);
pointer2 = find(OldChrom == city2(1));

NewChrom = OldChrom;
NewChrom(pointer1+1: pointer2-1) = flip(OldChrom(pointer1+1: pointer2-1));

end


% End of function
