size_dataset = [16 18 23 25 48 50 51 67 70 100 127]
Heuristic_RW = [15.6682 17.9620 19.9322 19.6030 20.9152 22.2340 22.4230 24.3151 25.7166 31.5103 34.1363]
Heuristic_Tournament = [20.4378 20.6876 20.9086 21.1584 23.6361 25.5176 25.5749 29.4216 31.0644 33.4962 35.7917]
Heuristic_sus = [20.1612 20.1992 20.8698 21.3004 22.8975 27.3692 27.3959 29.7921 29.5982 33.7457 35.2909]
ordered_crossover = [20.4934 20.7616 21.5710 21.7619 27.8655 28.9444 29.3323 31.1167 31.8106 34.3704 37.7270]
base_case = [20.0707 21.0247 21.1739 20.7543 22.5772 22.3878 22.8076 30.9571 31.2609 33.3108 34.7955]

figure;
hold on
plot(size_dataset,base_case)
plot(size_dataset,ordered_crossover)
plot(size_dataset,Heuristic_sus)
plot(size_dataset,Heuristic_RW)
plot(size_dataset,Heuristic_Tournament)
xlabel("number of cities")
ylabel("Runtime (seconds)")
