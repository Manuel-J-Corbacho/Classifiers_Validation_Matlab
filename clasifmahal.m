function [clases,tasaacierto] = clasifmahal(xtrn,ytrn,xtest,ytest)
    m=[]; i=min(ytrn);
    while i<=max(ytrn)
        aux   = myclass(xtrn,ytrn,i);
        m(:,i+1)= meanpat(aux);
        C{i+1}  = covpat(aux);
        i=i+1;
    end
    j=1;
    while j<=size(m,2)
        d(j,:)=d_mahal(xtest,m(:,j),C{j});
        j=j+1;
    end
    [~,clases]=min(d);
    clases=clases-1;
    aciertos=length(find(clases==ytest));
    tasaacierto=aciertos/length(ytest)*100;
end
