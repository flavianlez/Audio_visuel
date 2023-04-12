clear;
close all;
eta = 0.05;

% Lecture de l'image u :
u = imread('Images/Barbara.png');
u = double(im2gray(u));
[nb_lignes,nb_colonnes] = size(u);

% Calcul du spectre s :
s = fft2(u);
s = fftshift(s);			% Permet de positionner l'origine (0,0) au centre
[fx,fy] = meshgrid(1:nb_colonnes,1:nb_lignes);
fx = fx/nb_colonnes-0.5;
fy = fy/nb_lignes-0.5;
fi = sqrt((fx.^2 + fy.^2)) < eta;
s_barre = fi .* s; 

% Calcul de l'image modifiée :
u_barre = real(ifft2(ifftshift(s_barre)));

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Decomposition par modification du spectre','Position',[0.2*L,0,0.8*L,H]);

% Affichage des images u, u_barre et u-u_barre :
subplot(2,3,1);
affichage(u,'$x$','$y$','Image $u$');
subplot(2,3,2);
affichage(u_barre,'$x$','$y$','Image $\overline{u}$');
subplot(2,3,3);
affichage(u-u_barre,'$x$','$y$','Image $\overline{u}^c$');

% Affichage du logarithme du module des spectres s, s_barre et s-s_barre :
subplot(2,3,4);
affichage(log(abs(s)),'$f_x$','$f_y$','Spectre $\log|s|$');
subplot(2,3,5);
affichage(log(abs(s_barre)),'$f_x$','$f_y$','Spectre $\log|\overline{s}|$');
subplot(2,3,6);
affichage(log(abs(s-s_barre)),'$f_x$','$f_y$','Spectre $\log|\overline{s}^c|$');
