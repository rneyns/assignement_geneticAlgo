% Input parameters:
%    FitnV     - Column vector containing the fitness values of the
%                individuals in the population.
%    Nsel      - number of individuals to be selected

function NewChrIx = tournamentSelection(FitnV,Nsel)
   Selected = zeros(Nsel,1);
% randomly select 2 chromosomes and let them compete (a tournament size of
% 2 is taken)
  for i = 1:Nsel
      rand1 = randi(length(FitnV));
      rand2 = randi(length(FitnV));
      % we don't want to include the chromosomes that have already been
      % selected in the next tournament
      while ismember(rand1,Selected)
          rand1 = randi(length(FitnV));
      end
      while ismember(rand2,Selected)
          rand2 = randi(length(FitnV));
      end
      
      if FitnV(rand1) > FitnV(rand2)
        Selected(i) = rand1;
      else
        Selected(i) = rand2;
      end
  end

   NewChrIx = Selected;
end
