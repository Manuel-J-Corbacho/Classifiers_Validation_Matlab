function [tasasaciertos] = valrandomsampling(x,y,p,N)
    % N Número de muestras que se usan
    % p Porcentaje de datos usados en entrenamiento
    i=1; k=5; n=round( (p/100)*length(y) );
    while i<=N
        [x2,y2]=shuffle(x,y);
        xtrn=x2(:,1:n); xtest=x2(:,n+1:end);
        ytrn=y2(1:n);   ytest=y2(n+1:end);
        [~,aciertoeuc(i)]   = clasifeuclid(xtrn,ytrn,xtest,ytest);
        [~,aciertomahal(i)] = clasifmahal(xtrn,ytrn,xtest,ytest);
        [~,acierto1nn(i)]   = clasif1nn(xtrn,ytrn,xtest,ytest);
        [~,aciertoknn(i)]   = clasifknn(xtrn,ytrn,xtest,ytest,k);
        [~,aciertokmeans(i)]= clasifkmeans(xtrn,ytrn,xtest,ytest,k);
        i=i+1;
    end
    tasasaciertos=[mean(aciertoeuc);mean(aciertomahal);mean(acierto1nn);mean(aciertoknn);mean(aciertokmeans)];
end