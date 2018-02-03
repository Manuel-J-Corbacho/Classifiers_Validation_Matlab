function [clases,tasaacierto] = clasifkmeans(xtrn,ytrn,xtest,ytest,k)
    m=[]; i=1; j=1;
    %%Entrenamientos
    while i<=max(ytrn)+1,
        aux = myclass(xtrn,ytrn,i-1);
        m =[m kmeans(aux,k)];
        C{i}   = covpat(aux);
        i=i+1;
    end
    %%Test
    while j<=size(m,2)
        d(j,:)=d_mahal(xtest,m(:,j),C{ceil(j/k)});
        j=j+1;
    end
    [~,clases]=min(d);
    clases = ceil(clases/k);
    clases=clases-1;
    aciertos=length(find(clases==ytest));
    tasaacierto=aciertos/length(ytest)*100;
end