n1 = [
    5 0
    2 5
    4 8
    9 3
    10 6
    2 9
    8 0
    15 4
    0 6
];

n2 = [
    2 2
    11 7
    0 1
    3 0
    5 2
    11 1
    7 9
    6 2
    6 1
    1 8
];

steiner = inicializaSteiner(n1);

n = size(steiner,1); % Chomosome size
pm = 0.1;            % Mutation p
N = 50;              % Pop size
gens = 100;          % Generations

% Create fuctions
[obj, print] = makeFuns(n1, steiner);

pop = population('i', n, (n - 1) * pm);
pop = min(pop);
pop = random(pop, N);
pop = evaluate(pop, obj);

for i = 1:gens
    pop = tournament(pop);
    pop = crossover(pop);
    pop = mutation(pop);
    pop = evaluate(pop, obj);
    best = get(pop, 'best');
    disp(best.fitness);
end

print(best.r)
