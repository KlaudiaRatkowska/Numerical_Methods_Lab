clc
clear all
close all

div_poly=[];
div_tryg=[];

[XX,YY]=meshgrid(linspace(0,1,101),linspace(0,1,101));

for i = 5:45
    [x,y,f,xp,yp]=lazik(i);
    [p] = polyfit2d(x,y,f);
    [FP] = polyval2d(XX,YY,p);
    [t] = trygfit2d(x,y,f);
    [FT] = trygval2d(XX,YY,t);

    if i==5
        prev_FP=FP;
        prev_FT=FT;
    else
        div_poly=[ div_poly, max(max(abs(FP-prev_FP)))];
        div_tryg=[ div_tryg, max(max(abs(FT-prev_FT)))];

        prev_FP=FP;
        prev_FT=FT;
    end
end

plot(6:45,div_poly)
title("Interpolacja wielomianowa")
xlabel("K")
ylabel("Max wartość różnicy interpolacji")
print -dpng interpolacjaWielomianowa

plot(6:45,div_tryg)
title("Interpolacja trygonometryczna")
xlabel("K")
ylabel("Max wartość różnicy interpolacji")
print -dpng interpolacjaTrygonometryczna
