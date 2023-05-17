% Zadanie A
%------------------
clc
clear all
close all

N = 10;
density = 3; 
[Edges] = generate_network(N, density);

% Zadanie B
%------------------
d=0.85;
B = sparse(Edges(2,:), Edges(1,:), ones(1, size(Edges,2)), N, N);
L=sum(B)';
I=speye(N);
A = spdiags(1./L,0:0,N,N);
M = sparse(I - d*B*A);
 
b = zeros(N,1);
b(:,1) = (1 - d)/N;

% Zadanie C 
r = M\b;


% Zadanie D
%------------------
clc
clear all
close all

d = 0.85;
density = 10;
N = [500, 1000, 3000, 6000, 12000];


for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(2,:), Edges(1,:), ones(1, size(Edges,2)), N(i), N(i));
    L=sum(B)';
    I=speye(N(i));
    A = spdiags(1./L,0:0,N(i),N(i));
    M = sparse(I - d*B*A);     
    b = zeros(N(i),1);
    b(:,1) = (1 - d)/N(i);
    tic
    r = M\b;
    czas_Gauss(i) = toc;
end
plot(N, czas_Gauss)
title("Czas rozwiązania równań macierzowych")
xlabel("Rozmiar macierzy")
ylabel("Czas rozwiązań [s]")
print -dpng zadanieD.png

% Zadanie E
%------------------
clc
clear all
close all

d = 0.85;
density = 10;
N = [500, 1000, 3000, 6000, 12000];
stop = 1/10^14;

for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(2,:), Edges(1,:), ones(1, size(Edges,2)), N(i), N(i));
    L=sum(B)';
    I=speye(N(i));
    A = spdiags(1./L,0:0,N(i),N(i));
    M = sparse(I - d*B*A);     
    b = zeros(N(i),1);
    b(:,1) = (1 - d)/N(i);

    L = tril(M,-1); 
    U = triu(M,1);
    D = diag(diag(M));
    r = ones(N(i), 1);
    iter(i) = 1;
    tic
    while true
        r = -D\(L+U)* r + D\b;
        res = M*r - b;
        n(i, iter(i)) = norm(res);
        iter(i) = iter(i) + 1;
        if stop >= norm(res)
            break
        end
    end   
    czas_Jacobi(i) = toc;
end
plot(N, czas_Jacobi)
title("Czas wyznaczenia rozwiązania w zależności od N");
ylabel("Czas rozwiązań [s]");
xlabel("Rozmiar macierzy");
print -dpng zadanieE_czas.png

plot(N, iter)
title("Liczba iteracji wymagana do osiągnięcia rozwiązania w zależności od N");
ylabel("Liczba iteracji");
xlabel("Rozamiar macierzy");
print -dpng zadanieE_iteracje.png

semilogy(n(2, 1:iter(2)));
title("Wykres normy błędu rezydualnego ");
ylabel("Norma");
xlabel("Liczba iteracji");
print -dpng zadanieE_norma.png

% Zadanie F
%------------------
clc
clear all
close all

d = 0.85;
density = 10;
N = [500, 1000, 3000, 6000, 12000];
stop = 1/10^14;

for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(2,:), Edges(1,:), ones(1, size(Edges,2)), N(i), N(i));
    L=sum(B)';
    I=speye(N(i));
    A = spdiags(1./L,0:0,N(i),N(i));
    M = sparse(I - d*B*A);     
    b = zeros(N(i),1);
    b(:,1) = (1 - d)/N(i);

    L = tril(M,-1); 
    U = triu(M,1);
    D = diag(diag(M));
    r = ones(N(i), 1);
    iter(i) = 1;
    tic
    while true
        r = -(D+L)\(U*r) + (D+L)\b;
        res = M*r - b;
        n(i, iter(i)) = norm(res);
        iter(i) = iter(i) + 1;
        if stop >= norm(res)
            break
        end
    end   
    czas_Gauss_Seidl(i) = toc;
end
plot(N, czas_Gauss_Seidl)
title("Czas wyznaczenia rozwiązania w zależności od N");
ylabel("Czas rozwiązań [s]");
xlabel("Rozmiar macierzy");
print -dpng zadanieF_czas.png

plot(N, iter)
title("Liczba iteracji wymagana do osiągnięcia rozwiązania w zależności od N");
ylabel("Liczba iteracji");
xlabel("Rozmiar macierzy");
print -dpng zadanieF_iteracje.png

semilogy(n(2, 1:iter(2)));
title("Wykres normy błędu rezydualnego ");
ylabel("Norma");
xlabel("Liczba iteracji");
print -dpng zadanieF_norma.png


% Zadanie G
%------------------
clc
clear all
close all

load("Dane_Filtr_Dielektryczny_lab3_MN.mat");
stop = 1/10^14;
iter2 = 1;
iter3 = 1;
L = tril(M,-1); 
U = triu(M,1);
D = diag(diag(M));

% sposob pierwszy
tic;
r = M\b;
res = M*r - b;
time = toc;
fprintf("Czas metody bezpośredniej : %d [s]\n", time)
fprintf("Błąd rezydualny w metodzie bezpośredniej: %d\n", norm(res))

% sposob drugi
    while iter2 <= 500
        r = -D\(L+U)* r + D\b;
        res2 = M*r - b;
        iter2 = iter2 + 1;
        if stop >= norm(res2)
            break
        end
    end   
    fprintf("Błąd rezydualny po 500 iteracjach w metodzie Jacobiego: %d\n", norm(res2));

% sposob trzeci
    while iter3 <= 500
        r = -(D+L)\(U*r) + (D+L)\b;
        res3 = M*r - b;
        iter3 = iter3 + 1;
        if stop >= norm(res3)
            break
        end
    end   
    fprintf("Błąd rezydualny po 500 iteracjach w metodzie Gaussa-Seidla: %d\n", norm(res3));







