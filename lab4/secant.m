function [xvect,xdif,fx,it_cnt] = secant(a,b,eps,fun)
% fun - funkcja, ktorej miejsce zerowe bedzie poszukiwane
% [a,b] - przedzial poszukiwania miejsca zerowego
% eps - prog dokladnosci obliczen
% 
% xvect - wektor kolejnych wartosci przyblizonego rozwiazania
% xdif - wektor roznic pomiedzy kolejnymi wartosciami przyblizonego rozwiazania
% fx - wektor wartosci funkcji dla kolejnych elementow wektora xvect
% it_cnt - liczba iteracji wykonanych przy poszukiwaniu miejsca zerowego

xvect(1)= a;
xvect(2) = b;
fx(1) = fun(a);
fx(2) = fun(b);
xdif(1) = b;
xdif(2) = b - a;
for i = 3:1000
    xk = xvect(i-1);
    xkb = xvect(i-2);
    xvect(i) = xk - ((fun(xk)*(xk-xkb))/(fun(xk)-fun(xkb)));
    xdif(i) = abs(xvect(i) - xvect(i-1));
    fx(i) = fun(xvect(i));
    if abs(fx(i)) < eps
        it_cnt = i;
        return;
    end

end

end

