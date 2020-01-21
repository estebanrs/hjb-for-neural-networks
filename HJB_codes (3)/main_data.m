% Upload data
filename1 = 'Data/in1.csv';                    % variable to upload all data
filename2 = 'Data/out1.csv';  
alldata = upload_data(filename1,filename2);    % save all data in alldata 

%Training data
p = 250;                                       % No. of patters
w = 250;                                       % No. of data for testing
[data,newdata] = choosen_data(p,w,alldata);    % variables for choosen data
data = porfirio(data);                         % define maxims as Porfirio said
data = normalize_data(data);
newdata = porfirio(newdata);
newdata = normalize_data(newdata);
