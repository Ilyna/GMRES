X = gmres(A,b, 50);
for k=1:50
    res = norm(b-A*X(k),2)/norm(b,2);
    semilogy(k,res); hold on
end

for k=1:50
    beta=norm(b)
    q(1)=b/beta