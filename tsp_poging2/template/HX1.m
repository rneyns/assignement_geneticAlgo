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