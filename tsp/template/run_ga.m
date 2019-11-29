function run_ga(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP, ah1, ah2, ah3,var_bestn,stopping_treshold)
% usage: run_ga(x, y, 
%               NIND, MAXGEN, NVAR, 
%               ELITIST, STOP_PERCENTAGE, 
%               PR_CROSS, PR_MUT, CROSSOVER, 
%               ah1, ah2, ah3)
%
%
% x, y: coordinates of the cities
% NIND: number of individuals
% MAXGEN: maximal number of generations
% ELITIST: percentage of elite population
% STOP_PERCENTAGE: percentage of equal fitness (stop criterium)
% PR_CROSS: probability for crossover
% PR_MUT: probability for mutation
% CROSSOVER: the crossover operator
% calculate distance matrix between each pair of cities
% ah1, ah2, ah3: axes handles to visualise tsp
% varbestn: specifies how many generations are included in the calculation of
% the mean variation of the best fitness 
% stopping_treshold: what is the minimum variation in best fitness we allow
% (over N generations)
{NIND MAXGEN NVAR ELITIST STOP_PERCENTAGE PR_CROSS PR_MUT CROSSOVER LOCALLOOP};

        
        GGAP = 1 - ELITIST;
        mean_fits=zeros(1,MAXGEN+1); %stores the mean fitness for each generation to visualise it 
        worst=zeros(1,MAXGEN+1);%stores the worst fitness of each generation
        Dist=zeros(NVAR,NVAR);
        for i=1:size(x,1)
            for j=1:size(y,1)
                Dist(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2); % calculates the distance between all the different points
            end
        end
        % initialize population
        Chrom=zeros(NIND,NVAR);
        for row=1:NIND
            Chrom(row,:)=randperm(NVAR);
            %randperm creates a random permutation of integers between 1
            %and the number of cities --> so every city is represented by
            %an integer --> this can be seen as a path representation
            %because a path representation can't be invalid while an
            %adjacancy representation can be. 
            %Chrom(row,:)=path2adj(randperm(NVAR)); %--> in the original
            %algorithm this was used, that means that the currently used
            %representation is an adjacancy representation
            
            
        end
        gen=0;
        % number of individuals of equal fitness needed to stop
        stopN=ceil(STOP_PERCENTAGE*NIND);
        % evaluate initial population
        ObjV = tspfun(Chrom,Dist); %transformation from genotype to phenotype + defining the fitness based on this
        best=zeros(1,MAXGEN);%stores the best fitness of each generation 
        %var_bestn = 0.05*MAXGEN; % the number of previous generations that will be taken into account for the stopping algorithm
        %stopping_treshold = 0.005;
        var_best_mean = stopping_treshold + 1; % defining an a var_best_mean for the first var_bestn iteraties that is larger than the stopping treshold
        % generational loop
        while gen<MAXGEN  && var_best_mean > stopping_treshold
            sObjV=sort(ObjV);
          	best(gen+1)=min(ObjV);
        	minimum=best(gen+1);
            mean_fits(gen+1)=mean(ObjV);
            worst(gen+1)=max(ObjV);
            %calculation the variation of the best fitness to use it in the
            %stopping criterion
            if gen > var_bestn
                var_best1 = best(gen-(var_bestn-1):gen+1);
                var_best2 = best(gen-(var_bestn):gen);
                var_best = var_best2 - var_best1;
                var_best_mean = abs(mean(var_best));
                disp(var_best_mean)
            end
            for t=1:size(ObjV,1)
                if (ObjV(t)==minimum)
                    break;
                end
            end
            
            visualizeTSP(x,y,adj2path(Chrom(t,:)), minimum, ah1, gen, best, mean_fits, worst, ah2, ObjV, NIND, ah3);

            if (sObjV(stopN)-sObjV(1) <= 1e-15)
                  break;
            end          
        	%assign fitness values to entire population
        	FitnV=ranking(ObjV);
        	%select individuals for breeding
        	SelCh=select('sus', Chrom, FitnV, GGAP);
        	%recombine individuals (crossover)
            SelCh = recombin(CROSSOVER,SelCh,PR_CROSS);
            SelCh = mutateTSP('inversion',SelCh,PR_MUT);
            %evaluate offspring, call objective function
        	ObjVSel = tspfun(SelCh,Dist);
            %reinsert offspring into population
        	[Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
            %improving the population by removing local loops
            Chrom = tsp_ImprovePopulation(NIND, NVAR, Chrom,LOCALLOOP,Dist);
        	%increment generation counter
        	gen=gen+1;            
        end
        if gen < MAXGEN
            disp("The stopping criterion did it's job")
        end
end
