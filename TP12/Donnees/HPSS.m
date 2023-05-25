function [F_h, F_p] = HPSS(Y)
    n1 = 17;
    n2 = 17;
    F_h = medfilt2(Y, [1,n1]);
    F_p = medfilt2(Y,[n2,1]);
end