function alldata = upload_data(filename1,filename2)
%% ALL DATA
alldata.in = [];                            
alldata.out = [];                           
%DATOS DE ENTRADA
delimiterIn = ',';                           
A = importdata(filename1,delimiterIn);          %CARGA LOS DATOS DE ENTRENAMIENTO
for x1=1:size(A,1);
     alldata.in=[alldata.in; A(x1,:)];               %AGREGA AL VECTOR alldata.in
 end
%DATOS DE SALIDA
delimiterIn = ',';                           
B = importdata(filename2,delimiterIn);          %CARGA LOS DATOS DE ENTRENAMIENTO
for x1=1:size(B,1);                                 
     alldata.out=[alldata.out; B(x1,:)];        %AGREGA AL VECTOR alldata.out
end
end