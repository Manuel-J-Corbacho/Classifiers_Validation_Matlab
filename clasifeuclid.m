function[outy,tasaacierto] = clasifeuclid(xtrn,ytrn,xtest,ytest)
    i=min(ytrn);d=[];
    while i<=max(ytrn)
        m=meanpat( myclass(xtrn,ytrn,i) ) ;
        d=[d;d_euclid(xtest,m)];
        i=i+1;
    end
    [~,outy]=min(d);
    outy=outy-1;
    aciertos=length(find(outy==ytest));
    tasaacierto=aciertos/length(ytest)*100;
end