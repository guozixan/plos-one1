function dxdt = yingjiwuliu(t,x,K1,K2,K3,K4,alpha,beta,C1,C2,C3,W1,W2,W3,E1,E2,E3,I,L,R,S,T,P,B)
dxdt = zeros(3,1);

x1 = x(1);
x2 = x(2);
x3 = x(3);

dxdt(1)=x1*(1-x1)*(-I-K1+K2-K4+W1-K3*x2+K4*x3+W2*x3-W2*x2*x3+x3*beta*T);
dxdt(2)=x2*(1-x2)*(-C1+C2-S*x3+B*x1*x3);
dxdt(3)=x3*(1-x3)*(C3-E2+E3+S-B*x1-S*x2+B*x1*x2+x1*alpha*P-beta*P+x1*beta*P);
end