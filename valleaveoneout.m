function [tasasaciertos]= valleaveoneout(x,y)
    i=1;k=5;
    while i<=length(y)
        xtrn=[x(:,1:i-1) x(:,i+1:end)];
        ytrn=[y(1:i-1) y(i+1:end)];
        xtest=x(:,i);
        ytest=y(i);
        [~,aciertoeuc(i)]   = clasifeuclid(xtrn,ytrn,xtest,ytest);
        [~,aciertomahal(i)] = clasifmahal(xtrn,ytrn,xtest,ytest);
        [~,acierto1nn(i)]   = clasif1nn(xtrn,ytrn,xtest,ytest);
        [~,aciertoknn(i)]   = clasifknn(xtrn,ytrn,xtest,ytest,k);
        [~,aciertokmeans(i)]= clasifkmeans(xtrn,ytrn,xtest,ytest,k);
        i=i+1;
    end
    tasasaciertos=[mean(aciertoeuc);mean(aciertomahal);mean(acierto1nn);mean(aciertoknn);mean(aciertokmeans)];
end