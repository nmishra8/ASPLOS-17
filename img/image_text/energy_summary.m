fprintf('Single App: online offline leo poet leo+poet\n');
for j = 0:4
    id = (2*j + 1)*0.1;
    filename = ['dyn-eff-',num2str(id),'.txt'];
    fid = fopen(filename);
    c = textscan(fid,'%d %s %f %f %f %f %f %f %f %f' );  
    d = 100*cell2mat(c(4:8));
    fclose(fid);
    mat = d(1:(end-1),:);
    
    MAXX(j+1,:) = max(mat);
    MEANN(j+1,:)= mean(mat);
    fprintf('%5.2f, %5.2f|MAX %s|MEAN %s \n',id,min(min(mat)),...
        sprintf('%5.2f ',max(mat)),sprintf('%5.2f ',mean(mat)));
end

fprintf('MAX = %s | MEAN = %s \n', sprintf('%5.2f ',max(MAXX)),...
    sprintf('%5.2f ',mean(MEANN)));

% Single App: online offline leo poet leo+poet
%  0.10,  0.00|MAX 79.54 120.92 96.36 147.50 81.58 |MEAN 34.76 16.18 12.25 21.49  7.74  
%  0.30,  0.00|MAX 84.11 190.83 155.80 82.23 59.53 |MEAN 36.95 21.15 17.86 20.02  8.03  
%  0.50,  0.00|MAX 234.63 145.39 111.62 101.56 39.29 |MEAN 36.23 27.29 15.13 26.21  7.10  
%  0.70,  0.00|MAX 1063.42 306.76 306.84 143.66 53.86 |MEAN 81.36 29.61 30.80 38.98  7.51  
%  0.90,  0.00|MAX 834.31 189.36 834.31 189.32 14.29 |MEAN 70.58 31.24 78.66 22.38  3.31  
% MAX = 1063.42 306.76 834.31 189.32 81.58  | MEAN = 51.98 25.09 30.94 25.81  6.74  

clear;
fprintf('Multi App: online offline leo poet leo+poet\n');
for j = 0:4
    id = (2*j + 1)*0.1;
    filename = ['ma-eff-',num2str(id),'.txt'];
    fid = fopen(filename);
   c = textscan(fid,'%d %s %f %f %f %f %f' ); 
    d = 100*cell2mat(c(3:end));
    fclose(fid);
    mat = d(1:(end-1),:);
    
    MAXX(j+1,:) = max(mat);
    MEANN(j+1,:)= mean(mat);
    fprintf('%5.2f, %5.2f|MAX %s|MEAN %s \n',id,min(min(mat)),...
        sprintf('%5.2f ',max(mat)),sprintf('%5.2f ',mean(mat)));
end

 fprintf('MAX = %s | MEAN = %s \n', sprintf('%5.2f ',max(MAXX)),...
     sprintf('%5.2f ',mean(MEANN)));
% Multi App: online offline leo poet leo+poet
%  0.10,  0.00|MAX 87.28 122.91 96.92 122.78 86.94 |MEAN 39.14 17.43 13.11 21.46 23.25  
%  0.30,  0.00|MAX 88.81 199.22 163.18 75.08 53.04 |MEAN 30.32 20.88 16.83 20.59 17.81  
%  0.50,  0.00|MAX 233.39 145.36 67.21 115.62 44.18 |MEAN 25.39 17.74  7.23 27.66 11.42  
%  0.70,  0.00|MAX 863.72 57.18 24.55 158.70 100.12 |MEAN 45.48  4.62  2.08 20.50 21.99  
%  0.90,  0.00|MAX 746.71 141.47 746.71 141.27 110.09 |MEAN 51.93 16.91 59.36 14.89 16.70  
% MAX = 863.72 199.22 746.71 158.70 110.09  | MEAN = 38.45 15.52 19.72 21.02 18.23 clear;
% fprintf('Multi App: online offline leo poet leo+poet\n');

for j = 0:4
    id = (2*j + 1)*0.1;
    filename = ['ma-err-',num2str(id),'.txt'];
    fid = fopen(filename);
    c = textscan(fid,'%d %s %f %f %f %f %f' );  
    d = cell2mat(c(3:7));
    fclose(fid);
    mat = d(1:(end-1),:);
    
    MAXX(j+1,:) = max(mat);
    MEANN(j+1,:)= mean(mat);
    fprintf('%5.2f, %5.2f|MAX %s|MEAN %s \n',id,min(min(mat)),...
        sprintf('%5.2f ',max(mat)),sprintf('%5.2f ',mean(mat)));
end


% Multi App: online offline leo poet leo+poet
%  0.10,  0.00|MAX 47.09 18.37 16.30  8.09 11.79 |MEAN 10.03  0.90  0.80  3.53  6.11  
%  0.30,  0.00|MAX 44.63 71.91 70.34 36.79 11.13 |MEAN  8.08 19.69 15.15  5.59  4.72  
%  0.50,  0.12|MAX 50.15 37.59 29.54 25.66  7.65 |MEAN 15.99 20.13  9.90  9.42  4.34  
%  0.70,  0.23|MAX 79.87 30.55 28.09 26.51 24.23 |MEAN 19.79 16.77 12.07 10.15  6.42  
%  0.90,  8.21|MAX 84.35 22.82 84.35 26.52 30.44 |MEAN 21.94 13.46 18.42 15.42 14.65  
% fprintf('MAX = %s | MEAN = %s \n', sprintf('%5.2f ',max(MAXX)),...
%     sprintf('%5.2f ',mean(MEANN)));
% MAX = 84.35 71.91 84.35 36.79 30.44  | MEAN = 15.17 14.19 11.27  8.82  7.25  