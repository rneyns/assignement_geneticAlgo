%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in the path
%	representation
%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun2(Phen, Dist)
	ObjVal=Dist(Phen(:,1),1);
    ObjValx = 0;
    for k = 1:size(Phen,1)
        for t=2:size(Phen,2)
            ObjValx=ObjValx+Dist(Phen(k,t-1),Phen(k,t));
        end
        ObjVal(k) = ObjValx;
    end
end


% End of function