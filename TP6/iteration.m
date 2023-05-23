function [x_sortie,y_sortie] = iteration(x,y,Fx,Fy,gamma,A)
    indices = sub2ind(size(Fx),round(y),round(x));
    Bx = -gamma*Fx(indices);
    By = -gamma * Fy(indices);
    x_sortie = A*x + Bx;
    y_sortie = A*y + By;

end