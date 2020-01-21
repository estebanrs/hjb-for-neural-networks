function data = porfirio(data)
format long
minp1=[];
minp2=[];
for x1=1:size(data.in,1);                           
    if data.in(x1,3)>= 10;                           %CORTAR F2 CON MÁXIMO A 10
        data.in(x1,3)=10;
        minp1=[minp1,data.in(x1,1)];          %GUARDA P1 con F2 MAYOR O IGUAL A 10
        minp2=[minp2,data.in(x1,2)];          %GUARDA P2 CON F2 MAYOR O IGUAL A 10
    end
end

min_P1=mean(minp1);                           %TOMA EL MÍNIMO DE LAS PRESIPITACIONES MÁXIMAS
min_P2=mean(minp2);

for x1=1:size(data.in,1);   
    if data.in(x1,1)>=min_P1;                       %CORTA EL MÁXIMO DE LAS PRESIPITACIONES
        data.in(x1,1)=min_P1;                       
    end
    
    if data.in(x1,2)>=min_P2;
        data.in(x1,2)=min_P2;
    end
    
    if data.out(x1,1)>=10;                          %CORTA F3 CON MÁXIMO 10
        data.out(x1,1)=10;
    end
end
end
