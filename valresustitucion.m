function [tasasaciertos] = valresustitucion(x,y)
    xtrn=x;  ytrn=y;
    xtest=x; ytest=y;
    k=5;
    [~,aciertoeuc]   = clasifeuclid(xtrn,ytrn,xtest,ytest)
    [~,aciertomahal] = clasifmahal(xtrn,ytrn,xtest,ytest)
    [~,acierto1nn]   = clasif1nn(xtrn,ytrn,xtest,ytest)
    [~,aciertoknn]   = clasifknn(xtrn,ytrn,xtest,ytest,k)
    [~,aciertokmeans]= clasifkmeans(xtrn,ytrn,xtest,ytest,k)
    tasasaciertos=[aciertoeuc;aciertomahal;acierto1nn;aciertoknn;aciertokmeans];
end