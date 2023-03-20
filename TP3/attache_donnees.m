function AD = attache_donnees(I,moyennes,variances)

nl= size(I,1);
nc = size(I,2);
Id = ones(nl,nc);
N = size(moyennes,2);
AD = zeros(nl,nc,N);
for k= 1:N
    td = ((I -moyennes(k)*Id).^2) / variances(k);
    AD(:,:,k) = 1/2 * ( log(variances(k))*Id + td);
end