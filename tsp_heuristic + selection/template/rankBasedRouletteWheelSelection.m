% Input parameters:
%    FitnV     - Column vector containing the fitness values of the
%                individuals in the population.
%    Nsel      - number of individuals to be selected

function NewChrIx = rankBasedRouletteWheelSelection(FitnV,Nsel)
%defining SP (the selective pressure)
    SP = 1.1;
% rank the fitness values in ascending order
    rankedFitnV = sort(FitnV);
    Position = 1:length(FitnV);
   
% calculating the selection probability for each individual
    SelProb = 2-SP+(2*(SP-1)*(Position-1)/(length(FitnV)-1));
    Cum_SelProb = cumsum(SelProb);
    [max_SelProb, ~] = max(Cum_SelProb);
    Selected = zeros(Nsel,1);
% randomly select 2 chromosomes and let them compete (a tournament size of
% 2 is taken)
  for i = 1:Nsel
      randn = (max_SelProb-(2-SP)).*rand()+ (2-SP);
      % we don't want to include the chromosomes that have already been
      % selected in the next tournament
      largerThan = find(Cum_SelProb > randn);
      Selectedi1 = largerThan(1);
      Selectedi = find(FitnV == rankedFitnV(Selectedi1));
      Selected(i) = Selectedi(1);
  end
      

   NewChrIx = Selected;
end