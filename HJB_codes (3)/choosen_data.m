function[data,newdata]=choosen_data(p,w,alldata)
%% ESCOGER PATRONES DE ENTRENAMIENTO
data.in = [];                                
data.out = [];
%GENERAR NÚMEROS ALEATORIOS
total = size(alldata.in,1);                     %TOTAL DE DATOS EXISTENTES
r = unique(randi([1 total],1,p));               %GENERAR NÚMEROS ALEATORIOS Y QUITAR REPETIDOS                         
x1 = setdiff(1:total, r);                       %QUITAR LOS PATRONES YA USADOS
while size(r,2) < p;
     r = [r, x1(randi([1 size(x1,2)],1))];      %AGREGAR LOS PATRONES DIFERENTES QUE FALTEN
     r=unique(r);                               %VERIFICAR QUE YA NO HAY REPETIDOS
end
 r = sort(r);                                   %ORDENAR LOS PATRONES A USAR
 
% DATA IN
for x1=1:size(r,2);                             %ESCOGE TANTOS VECTORES COMO p
     data.in=[data.in; alldata.in(r(x1),:)];                
end 
%DATA OUT
for x1=1:size(r,2);
     data.out=[data.out; alldata.out(r(x1),:)];                 
end


allnewdata.in=[];
allnewdata.out=[];
newdata.in=[];
newdata.out=[];
x1 = setdiff(1:size(alldata.in,1), r);                       %QUITAR LOS PATRONES YA USADOS
% %% ALL DATA NEW
for x2=1:size(x1,2);                             %ESCOGE TANTOS VECTORES COMO p
     allnewdata.in=[allnewdata.in; alldata.in(x1(x2),:)];                
end 
%DATA OUT
for x2=1:size(x1,2);
     allnewdata.out=[allnewdata.out;alldata.out(x1(x2),:)];                 
end

% GENERAR NÚMEROS ALEATORIOS
total = size(allnewdata.in,1);                     %TOTAL DE DATOS EXISTENTES
r = unique(randi([1 total],1,w));               %GENERAR NÚMEROS ALEATORIOS Y QUITAR REPETIDOS                         
x1 = setdiff(1:total, r);                       %QUITAR LOS PATRONES YA USADOS
while size(r,2) < w;
     r = [r, x1(randi([1 size(x1,2)],1))];      %AGREGAR LOS PATRONES DIFERENTES QUE FALTEN
     r=unique(r);                               %VERIFICAR QUE YA NO HAY REPETIDOS
end
 r = sort(r);                                   %ORDENAR LOS PATRONES A USAR
 
% DATA IN
for x1=1:size(r,2);                          %ESCOGE TANTOS VECTORES COMO w
     newdata.in=[newdata.in; allnewdata.in(r(x1),:)];                
end 
%DATA OUT
for x1=1:size(r,2);
     newdata.out=[newdata.out;allnewdata.out(r(x1),:)];                 
end