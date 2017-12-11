function data = readLogs(logname)
file_ID = fopen(logname,'r');
formatSpec = '%*s %*d %*s %*s %*d %*s %f'; 
value = textscan(file_ID, formatSpec); 
fclose(file_ID);
value = value{1};

ind = 1; 
for i = 1:length(value)/4
    value_t(i,1) = value(ind); 
    ind = ind + 1; 
    value_n(i,1) = value(ind); 
    ind = ind + 1; 
    value_g(i,1) = value(ind); 
    ind = ind + 1; 
    value_score(i,1) = value(ind); 
    ind = ind + 1; 
end 

data.t = value_t(:,1);
data.n = value_n(:,1);
data.g = value_g(:,1);
data.score = value_score(:,1);

end

