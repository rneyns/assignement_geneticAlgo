% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function offspring = PMX_intermediate(parent1,parent2);
   possible_numbers = 1:length(parent1);
    
   offspring1 = zeros(size(parent1));
   offspring2 = zeros(size(parent1));

   breaking_point1 = randi(1,length(parent1));
   breaking_point2 = randi(1,length(parent1));
   
   while breaking_point1 >= breaking_point2
       breaking_point2 = randi(1,length(parent1));
   end
   
   %exchanging the middle part of the parents
   offspring1(1:breaking_point1) = parent1(1:breaking_point1);
   offspring1(breaking_point1:breaking_point2) = parent2(breaking_point1:breaking_point2);
   offspring1(breaking_point2:end) = parent1(breaking_point2:end);
   offspring2(1:breaking_point1) = parent2(1:breaking_point1);
   offspring2(breaking_point1:breaking_point2) = parent1(breaking_point1:breaking_point2);
   offspring2(breaking_point2:end) = parent2(breaking_point2:end);
   
   %find out which cities are missing from the list for offspring 1
   missing_values = [];
   
   for k = 2:length(offspring1)
       if not(ismember(offspring1(k),possible_numbers))
           missing_values = [missing_values k];
       end
   end
           
   nondouble_items = [offspring1(1)];
   count = 1;
   for k = 2:length(offspring1)
       if not(ismember(k,breaking_point1:breaking_point2))
           if ismember(offspring1(k),nondouble_items)
               offspring1(k) = missing_values(counter);
               count = count + 1;
           else
               nondouble_items = [nondouble_items offspring1(k)]
           end
       end
   end
   
   %find out which cities are missing from the list for offspring 2
   missing_values = [];
   
   for k = 2:length(offspring1)
       if not(ismember(offspring1(k),possible_numbers))
           missing_values = [missing_values k];
       end
   end
           
   nondouble_items = [offspring2(1)];
   count = 1;
   for k = 2:length(offspring1)
       if not(ismember(k,breaking_point1:breaking_point2))
           if ismember(offspring2(k),nondouble_items)
               offspring2(k) = missing_values(counter);
               count = count + 1;
           end
       end
   end
   offspring = [offspring1 ; offspring2];
   
    
   
           
       
       