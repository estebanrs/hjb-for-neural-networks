function data =normalize_data(data)
format long
%% NORMALIZAR PATRONES
% PATRONES DE ENTRADA
M = max(data.in);
m = min(data.in);

for x2=1:size(data.in,2);                          %ESCOGE TANTOS VECTORES COMO p
    data.in(:,x2) = data.in(:,x2)/M(x2);            
end

M = max(data.out);
m = min(data.out);

%PATRONES DE SALIDA
for x2=1:size(data.out,2);                          %ESCOGE TANTOS VECTORES COMO p
    for x1=1:size(data.out,1);
        data.out(x1,x2) = data.out(x1,x2)/M;
    end              
end

data.out(data.out==1) = 0.9;
data.out(data.out==0) = 0.1;

end