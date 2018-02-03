function [clases,tasaacierto] = clasif1nn(xtrn,ytrn,xtest,ytest)
    i=1; clases=zeros(1,size(xtest,2));
    while i<=size(xtest,2)
        d=d_euclid(xtrn,xtest(:,i));
        [~,posmin(i)]=min(d);
        i=i+1;
    end
    clases=ytrn(posmin);
    aciertos=length(find(clases==ytest));
    tasaacierto=aciertos/length(ytest)*100;
end