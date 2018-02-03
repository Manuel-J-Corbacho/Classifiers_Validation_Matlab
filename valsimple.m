function [tasasaciertos] = valsimple(x,y,p)
% p Porcentaje de datos usados en entrenamiento
% x Patrones
% y Clases
    N=round((p/100)*length(y));
    xtrn=x(:,1:N);
    ytrn=y(1:N);
    xtest=x(:,N+1:end);
    ytest=y(N+1:end);
    k=5;
    [~,aciertoeuc]   = clasifeuclid(xtrn,ytrn,xtest,ytest)
    [~,aciertomahal] = clasifmahal(xtrn,ytrn,xtest,ytest)
    [~,acierto1nn]   = clasif1nn(xtrn,ytrn,xtest,ytest)
    [~,aciertoknn]   = clasifknn(xtrn,ytrn,xtest,ytest,k)
    [~,aciertokmeans]= clasifkmeans(xtrn,ytrn,xtest,ytest,k)
    tasasaciertos=[aciertoeuc;aciertomahal;acierto1nn;aciertoknn;aciertokmeans];
end