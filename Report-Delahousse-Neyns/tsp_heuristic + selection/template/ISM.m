% reciprocal exchange : N-random cities in a tour are swapped
%
% Representation is an integer specifying which encoding is used
%	1 : adjacency representation
%	2 : path representation
%

function NewChrom = ISM(OldChrom,Representation)

NewChrom=OldChrom;

if Representation==1 
	NewChrom=adj2path(NewChrom);
end

% Original index of the city we want to insert
O = randi(length(NewChrom));
% Target index where we want to insert the city
T = randi(length(NewChrom));

% Ensures a O and T have different values
while O == T
    O = randi(length(NewChrom));
    T = randi(length(NewChrom));
end

% Remember the value of the city before it is replaced
A = NewChrom(O);

% Shifts the cities
if O < T
    % when the city should be inserted later in the queue
    NewChrom(O:T-1)=NewChrom(O+1:T);
elseif O > T
    % when the city should be inserted earlier in the queue
    NewChrom(T+1:O) = NewChrom(T:O-1);
end

%Adds the city to its place
NewChrom(T) = A;

if Representation==1
	NewChrom=path2adj(NewChrom);
end

end


% End of function
