% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function offspring = HX1_intermediate(parent1,parent2,Dist)
   start_point1 = randi(length(parent1));
   if start_point1 == 1
       pointer1 = length(parent1);
       pointer2 = start_point1 + 1;
   elseif start_point1 == length(parent1)
       pointer1 = start_point1 - 1;
       pointer2 = 1;
   else
       pointer1 = start_point1 - 1;
       pointer2 = start_point1 + 1;
   end
   
   start_point2 = find(parent2 == parent1(start_point1));
   
   if start_point2 == 1
       pointer3 = length(parent1);
       pointer4 = start_point2 + 1;
   elseif start_point2 == length(parent1)
       pointer3 = start_point2 - 1;
       pointer4 = 1;
   else
       pointer3 = start_point2 - 1;
       pointer4 = start_point2 + 1;
   end
   
   offspring1 = zeros(size(parent1));
   offspring1(1) = parent1(start_point1);
   start_point = parent1(start_point1);
   parent1(start_point1) = 0;
   parent2(start_point2) = 0;
   for i = 2:(length(parent1)-1)
       distance1 = Dist(start_point,parent1(pointer1));
       distance2 = Dist(start_point,parent1(pointer2));
       distance3 = Dist(start_point,parent2(pointer3));
       distance4 = Dist(start_point,parent2(pointer4));
       distance = [distance1;distance2;distance3;distance4];
       pointers = [pointer1;pointer2;pointer3;pointer4];

       min_distance = min(distance);
       location = find(distance == min_distance);
       if length(location) > 1
           final_pointer = randi(length(location));
           location = location(final_pointer);
           pointer = pointers(location);
       else
           pointer = pointers(location);
       end
       
       if location < 3
           offspring_el = parent1(pointer);
           start_point = parent1(pointer); 
           parent2(parent2 == parent1(pointer)) = 0;
           parent1(pointer) = 0;
       else
           offspring_el = parent2(pointer);
           start_point = parent2(pointer); 
           parent1(parent1 == parent2(pointer)) = 0;
           parent2(pointer) = 0;
       end
       offspring1(i) = offspring_el;
       
% Changing the location of the pointer that has been used
       
       if location == 1
           if pointer1 == 1
               pointeri = length(parent1);
           else
               pointeri = pointer1 - 1;
           end
           while parent1(pointeri) == 0
               if pointeri == 1
                   pointeri = length(parent1);
               else
                   pointeri = pointeri - 1;
               end
           end
           pointer1 = pointeri;
       end
       if location == 2
               if pointer2 == length(parent1)
                   pointeri = 1;
               else
                    pointeri = pointer2 + 1;
               end
           while parent1(pointeri) == 0
               if pointeri == length(parent1)
                   pointeri = 1;
               else
                   pointeri = pointeri + 1;
               end
           end
           pointer2 = pointeri;
       end
       if location == 3
           if pointer3 == 1
               pointeri = length(parent1);
           else
               pointeri = pointer3 - 1;
           end
           while parent2(pointeri) == 0
               if pointeri == 1
                   pointeri = length(parent1);
               else
                   pointeri = pointeri - 1;
               end
           end
           pointer3 = pointeri;
       end
       if location == 4
           if pointer4 == length(parent1)
               pointeri = 1;
           else
                pointeri = pointer4 + 1;
           end
           while parent2(pointeri) == 0
               if pointeri == length(parent1)
                   pointeri = 1;
               else
                   pointeri = pointeri + 1;
               end
           end
           pointer4 = pointeri;
       end
 
   
%Changing the location of the pointers that might point to a zero element
%now
   while parent1(pointer1) == 0
       if pointer1 == 1
           pointer1 = length(parent1);
       else
           pointer1 = pointer1 - 1;
       end
   end
   while parent1(pointer2) == 0
       if pointer2 == length(parent1)
           pointer2 = 1;
       else
           pointer2 = pointer2 + 1;
       end
   end
   while parent2(pointer3) == 0
       if pointer3 == 1
           pointer3 = length(parent1);
       else
           pointer3 = pointer3 - 1;
       end
   end
   while parent2(pointer4) == 0
       if pointer4 == length(parent1)
           pointer4 = 1;
       else
           pointer4 = pointer4 + 1;
       end
   end
   end
   offspring1(end) = parent1(parent1 ~= 0);
   offspring = offspring1;
end
