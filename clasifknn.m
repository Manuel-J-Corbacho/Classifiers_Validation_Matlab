function [clases,tasaacierto] = clasifknn(xoriginales,yoriginales,xnoclasificadas,ytest,k)
    i=1; clases=zeros(1,size(xnoclasificadas,2));
    while i<=size(xnoclasificadas,2)
        d=d_euclid(xoriginales,xnoclasificadas(:,i));
        [~,minimos]=sort(d);
        aux=yoriginales(minimos(1:k));
        [clases(:,i),~]=moda(aux);
        i=i+1;
    end
    aciertos=length(find(clases==ytest));
    tasaacierto=aciertos/length(ytest)*100;
end

