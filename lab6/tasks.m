clc
clear all
close all


load trajektoria1

%task2
plot3(x, y, z, 'o')
grid on
axis equal
title("Drone movement path")
xlabel("x [m]")
ylabel("y [m]")
zlabel("x [m]")

%task3 - txt

%task4 
N = 60;
xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaWielomianowa(n, y, N);
za = aproksymacjaWielomianowa(n, z, N);

plot3(x, y, z, 'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real and approximated trajectory for N=60")
xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")
legend("Real", 'Approximated')
hold off
print -dpng task4

%task5
clc
clear all
close all

load trajektoria2.mat
N = 60;
xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaWielomianowa(n, y, N);
za = aproksymacjaWielomianowa(n, z, N);

plot3(x, y, z, 'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real and polynominal approximated trajectory for N=60")
xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")
legend("Real", "Approximated")
hold off
print -dpng task5a

M = length(n);
err = [];
for N = 1:71
    xa = aproksymacjaWielomianowa(n, x, N);
    ya = aproksymacjaWielomianowa(n, y, N);
    za = aproksymacjaWielomianowa(n, z, N);

    xErr = (sqrt(sum((x - xa).^2))/M);
    yErr = (sqrt(sum((y - ya).^2))/M);
    zErr = (sqrt(sum((z - za).^2))/M);

    err(N) = xErr + yErr + zErr;
end

semilogy(err);
title("Polynominal approximation error")
xlabel("N")
ylabel("value")
print -dpng task5b

%task6
N = 60;
xa = aproksymacjaTrygonometryczna(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaTrygonometryczna(n, y, N);
za = aproksymacjaTrygonometryczna(n, z, N);

plot3(x, y, z, 'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real and trygonometric approximation trajectory for N=60")
xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")
legend("Real", "Approximated")
hold off
print -dpng task6a


M = length(n);
err2 = [];
for N = 1:71
    xa = aproksymacjaTrygonometryczna(n, x, N);
    ya = aproksymacjaTrygonometryczna(n, y, N);
    za = aproksymacjaTrygonometryczna(n, z, N);

    xErr = (sqrt(sum((x - xa).^2))/M);
    yErr = (sqrt(sum((y - ya).^2))/M);
    zErr = (sqrt(sum((z - za).^2))/M);

    err2(N) = xErr + yErr + zErr;
end

semilogy(err);
title("Trygonometric approximation error")
xlabel("N")
ylabel("value")
print -dpng task6b

N = 150;
xa = aproksymacjaTrygonometryczna(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaTrygonometryczna(n, y, N);
za = aproksymacjaTrygonometryczna(n, z, N);

plot3(x, y, z, 'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real and trygonometric approximation trajectory N=150")
xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")
legend("Real", "Trygonometric")
hold off
print -dpng task6c


