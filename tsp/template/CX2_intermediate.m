% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function offspring = CX2_intermediate(parent1,parent2)
   offspring1 = zeros(size(parent1));
   offspring2 = zeros(size(parent2));
   %step 2
   offspring1(1) = parent2(1);
   %step 3
   offspring2(1) = parent2(parent1 == parent2(parent1 == offspring1(1)));
   %step 4
   offspring1(2) = parent2(parent1 == offspring2(1));
   position = 2;
   shortParent1 = parent1;
   while offspring2(end - 1) == 0
       parent1
       parent2
       offspring1
       offspring2
       %step 3
       offspring2(position) = parent2(parent1 == parent2(parent1 == offspring1(position)));
       %step 5
       if ismember(shortParent1(1),offspring2)
           for i = 1:length(offspring1)
               if offspring2(i) > 0 || offspring1(i) > 0
                   parent1(parent1 == offspring1(i)) = 0;
                   parent1(parent1 == offspring2(i)) = 0;
                   parent1(parent2 == offspring2(i)) = 0;
                   parent1(parent2 == offspring1(i)) = 0;
                   parent2(parent1 == offspring1(i)) = 0;
                   parent2(parent1 == offspring2(i)) = 0;
                   parent2(parent2 == offspring2(i)) = 0;
                   parent2(parent2 == offspring1(i)) = 0;
               end
           end
           missing_valuesO2 = setdiff(offspring1,offspring2)
           missing_valuesO1 = setdiff(offspring2,offspring1)
           if not(isempty(missing_valuesO2))
               for j = 1:length(missing_valuesO2)
                   position = position + 1;
                   offspring1(position) = missing_valuesO1(j);
                   offspring2(position) = missing_valuesO2(j);
               end
           end
           shortParent1 = parent1(parent1 > 0)
           offspring1(position + 1) = parent2(shortParent1(1));
       else
           %step 4
           offspring1(position + 1) = parent2(parent1 == offspring2(position));
       end
       position = position + 1;
   end
   
   offspring2(position) = shortParent1(1);
   
   offspring = [offspring1 ; offspring2];
end
   