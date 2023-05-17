function zadanie1()

function plot_circle(X, Y, R)
    theta = linspace(0,2*pi);
    x = R*cos(theta) + X;
    y = R*sin(theta) + Y;
    plot(x,y)
    hold on
end

    function crossing = check_circle_crossing(radius1, radius2, x1, y1, x2, y2)
    dist = sqrt((x2 - x1)^2 + (y2 - y1)^2);
    if dist < radius1 + radius2
        crossing = true;
    else
        crossing = false;
    end
end

    clf
    close all;
    clear all;

    a = 2;
    r_max = a/2;
    n_max = 200;
    area = 0;
    areaPlot=zeros(n_max);
    X=zeros(n_max);
    Y=zeros(n_max);
    r=zeros(n_max);

    los=zeros(n_max);
    n=1;
    while (n<=n_max)
        valid = false;
        while (valid == false)
            X(n)= a*rand(1);
            Y(n)= a*rand(1);
            r(n) = r_max*rand(1);
            los(n)=los(n)+1;
            if X(n)+r(n)<a && X(n)-r(n)>0 && Y(n)+r(n)<a && Y(n)-r(n)>0
                valid = true;
                for i=1:n-1
                    crossing=check_circle_crossing(r(n),r(i),X(n),Y(n),X(i),Y(i));
                    if crossing == true
                        valid = false;
                        break;
                    end
                end
            end                           
        end

        area = area + pi*r(n)^2;
        areaPlot(n) = area;
        axis equal
        axis([0 a 0 a])
        plot_circle(X(n),Y(n),r(n))
        title("Pęcherzykowy kwadrat")
        ylabel("y")
        xlabel("x")
        pause(0.01)
        n = n + 1;
    end
    hold off

    avg = cumsum(los);
    for i = 1:n_max
        avg(i) = avg(i)/i;
    end

    figure 
    plot(areaPlot)
    title("Powierzchnia całkowita kół")
    ylabel("Powierzchnia")
    xlabel("Liczba narysowanych okręgów")
    print -dpng zadanie1a

    figure 
    plot(avg)
    title("Średnia liczba losowań")
    ylabel("Liczba losowań")
    xlabel("Liczba narysowanych okręgów")
    print -dpng zadanie1b


end