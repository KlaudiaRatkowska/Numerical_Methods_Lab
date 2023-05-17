function [xvect,xdif,fx,it_cnt] = bisection(a,b,eps,fun)
% fun - funkcja, ktorej miejsce zerowe bedzie poszukiwane
% [a,b] - przedzial poszukiwania miejsca zerowego
% eps - prog dokladnosci obliczen
% 
% xvect - wektor kolejnych wartosci przyblizonego rozwiazania
% xdif - wektor roznic pomiedzy kolejnymi wartosciami przyblizonego rozwiazania
% fx - wektor wartosci funkcji dla kolejnych elementow wektora xvect
% it_cnt - liczba iteracji wykonanych przy poszukiwaniu miejsca zerowego
cp = 1;
for i = 1:1000
    c = (a + b)/2;
    xdif(i) = abs(c - cp);
    xvect(i) = c;
    fx(i) = fun(c);
    cp = c;
    if abs(fun(c)) < eps || abs(b - a) < eps
        it_cnt = i;
        return;
    elseif fun(a)*fun(c) < 0
        b = c;
    else 
        a = c;
    end
end

end

