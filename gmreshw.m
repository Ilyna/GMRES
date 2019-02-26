function X = kgmreshw(A,b)

n=1182;
Q=zeros(n,n);
for k=1:50
    h=zeros(k+1,k);
    beta=norm(b);
    q=zeros(1182,1);
    Q(:,1)=b/beta;
    for j=1:k
        z=A*Q(:,j); %column vector
        for i=1:j
            h(i,j)=Q(:,i)'*z;  %scalar
            z=z-h(i,j)*Q(:,i);
        end
        z=z-Q(:,1:j)*(Q(:,1:j)'*z);
        h(j+1,j) = norm(z);
        if h(j+1,j)== 0
            break;
        else
            Q(:,j+1)=z/h(j+1,j);
        end
    end
    E=eye(k+1,k);
    y=h\(beta*E(:,1));
    X=Q(:,1:k)*y;
    res(k) = norm(b-A*X)/norm(b);
    semilogy(res, '-o'); hold on;
end
