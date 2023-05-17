clc
clear all
close all


a = 0;   
b = 50;
c = 1;
d = 60000;

[xvect, xdif, fx, it_cnt] = bisection(a,b,1e-12,@compute_impedance);

plot(1:it_cnt, xvect)
title("Wartości przybliżonej prędkości kątowej używając metodę bisekcji");
ylabel("prędkość kątowa [rad/s]");
xlabel("iteracja");
print -dpng impedancja_przyblizenia_bisekcja.png;

semilogy(1:it_cnt, xdif)
title("Zmiana wartości prędkości kątowej używając metody bisekcji");
ylabel("różnica poprzedniej i obecnej wartości prędkości kątowej [rad/s]");
xlabel("iteracja");
print -dpng impedancja_roznice_bisekcja.png;



[xvect,xdif,fx,it_cnt] = bisection(a,b,1e-12, @velocity);

plot(1:it_cnt, xvect)
title("Wartość przybliżonego czasu używając metodę bisekcji");
ylabel("czas t[s]");
xlabel("iteracja");
print -dpng predkosc_przyblizenia_bisekcja.png;

semilogy(1:it_cnt, xdif)
title("Różnica między poprzednią i obecną wartością czasu używając metodę bisekcji");
ylabel("różnica poprzedniej i obecnej wartości czasu t[s]");
xlabel("iteracja");
print -dpng predkosc_roznice_bisekcja.png;



[xvect,xdif,fx,it_cnt] = bisection(c,d,1e-3,@time);

plot(1:it_cnt, xvect)
title("Wartość przybliżenia n używając metodę bisekcji");
ylabel("n");
xlabel("iteracja");
print -dpng czas_przyblizenia_bisekcja.png;

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami n używając metodę bisekcji");
ylabel("różnica poprzedniej i obecnej wartości n");
xlabel("iteracja");
print -dpng czas_roznice_bisekcja.png;



[xvect,xdif,fx,it_cnt] = secant(a,b,1e-12,@compute_impedance);

plot(1:it_cnt, xvect)
title("Wartość przybliżenia prędkości kątowej używając metodę siecznych");
ylabel("prędkość kątowa [rad/s]");
xlabel("iteracja");
print -dpng impedancja_przyblizenia_sieczne.png;

semilogy(1:it_cnt, xdif)
title("Różnice między wartościami prędkości kątowej używając metodę siecznych");
ylabel("różnica poprzednej i obecnej wartości prędkości kątowej [rad/s]");
xlabel("iteracja");
print -dpng impedancja_roznice_sieczne.png


[xvect,xdif,fx,it_cnt] = secant(a,b,1e-12,@velocity);

plot(1:it_cnt, xvect)
title("Wartość przybliżenia czasu używając metodę siecznych");
ylabel("czas t[s]");
xlabel("iteracja");
print -dpng predkosc_przyblizenia_sieczne.png;

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami czasu używając metodę siecznych");
ylabel("różnica poprzedniej i obecnej wartości czasu t[s]");
xlabel("iteracja");
print -dpng predkosc_roznice_sieczne.png


[xvect,xdif,fx,it_cnt] = secant(c,d,1e-3,@time);

plot(1:it_cnt, xvect)
title("Wartość przybliżenia n używając metodę siecznych");
ylabel("n");
xlabel("iteracja");
print -dpng czas_przyblizena_sieczne.png;

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami n używając metodę siecznych");
ylabel("różnice poprzedniej i obecnej wartości n");
xlabel("iteracja");
print -dpng czas_roznice_sieczne.png;
