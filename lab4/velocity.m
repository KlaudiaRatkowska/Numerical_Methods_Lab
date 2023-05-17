function [v] = velocity(t)
    
    g = 9.81;
    m = 150000;
    q = 2700;
    u = 2000;
    v = u*log(m/(m-q*t)) - g*t;
    v = v - 750;

end