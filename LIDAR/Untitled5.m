clc
close all
clear
iteration_time = 130;

%% Run ICP (fast kDtree matching and extrapolation)
datal = csvread('data_xyz_1.csv');
M = datal';

for csv_num = 2:5
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    
    data2 = csvread(num);
    D = unique(data2, 'rows');
    D = D';
    
    [Ricp, Ticp, ER, t] = icp (M, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation',true);
    
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M = [Dicp M];
    
end
figure;
pt = pointCloud(M');
pcshow(pt);

%%
data2=csvread('data_xyz_6.csv');
M2 = data2';
for csv_num = 7:10
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data2= csvread(num);
    D = unique(data2, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M2, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M2a = [Dicp M2];
    
    
end
pt2 = pointCloud(M2a');

theta = 0;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout2 = pctransform(pt2,tform);
M2=pcCloudout2.Location;
M2(:,1) = pcCloudout2.Location(:,1)+50;
M2(:,2) = pcCloudout2.Location(:,2)+75;
M2(:,3) = pcCloudout2.Location(:,3);
M2=M2';
figure;
pt = pointCloud(M2');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M2, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true); 
n = length(M2);
Dicp = Ricp * M2 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data3=csvread('data_xyz_11.csv');
M3 = data3';
for csv_num = 12:15
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data3a= csvread(num);
    D = unique(data3a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M3, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M3a = [Dicp M3];
    
    
end
pt3 = pointCloud(M3a');

theta = 10;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout3 = pctransform(pt3,tform);
M3=pcCloudout3.Location;
M3(:,1) = pcCloudout3.Location(:,1);
M3(:,2) = pcCloudout3.Location(:,2)+200;
M3(:,3) = pcCloudout3.Location(:,3);
M3=M3';
figure;
pt = pointCloud(M3');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M3, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
   
n = length(M3);
Dicp = Ricp * M3 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data4=csvread('data_xyz_16.csv');
M4 = data4';
for csv_num = 17:20
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data4a= csvread(num);
    D = unique(data4a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M4, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M4 = [Dicp M4];
    
    
end
pt4 = pointCloud(M4');

theta = 17;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout4 = pctransform(pt4,tform);
M4=pcCloudout4.Location;
M4(:,1) = pcCloudout4.Location(:,1);
M4(:,2) = pcCloudout4.Location(:,2)+200;
M4(:,3) = pcCloudout4.Location(:,3);
M4=M4';
figure;
pt = pointCloud(M4');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M4, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
   
n = length(M4);
Dicp = Ricp * M4 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data5=csvread('data_xyz_21.csv');
M5 = data5';
for csv_num = 22:25
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data5a= csvread(num);
    D = unique(data5a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M5, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M5 = [Dicp M5];
    
    
end

pt5 = pointCloud(M5');

theta = 8;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout5 = pctransform(pt5,tform);
M5=pcCloudout5.Location;
M5(:,1) = pcCloudout5.Location(:,1);
M5(:,2) = pcCloudout5.Location(:,2)+350;
M5(:,3) = pcCloudout5.Location(:,3);
M5=M5';
figure;
pt = pointCloud(M5');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M5, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
   
n = length(M5);
Dicp = Ricp * M5 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data6=csvread('data_xyz_26.csv');
M6 = data6';
for csv_num = 27:28
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data6a= csvread(num);
    D = unique(data6a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M6, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M6 = [Dicp M6];
    
    
end
pt6 = pointCloud(M6');

theta = 40;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt6,tform);
M6=pcCloudout.Location;
M6(:,1) = pcCloudout.Location(:,1);
M6(:,2) = pcCloudout.Location(:,2)+550;
M6(:,3) = pcCloudout.Location(:,3);
M6a=M6';
figure;
pt = pointCloud(M6a');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M6a, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true); 
n = length(M6a);
Dicp = Ricp * M6a + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data7=csvread('data_xyz_29.csv');
M7 = data7';
for csv_num = 30:35
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data7a= csvread(num);
    D = unique(data7a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M7, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M7 = [Dicp M7]; 
end
pt7 = pointCloud(M7');

theta = 85;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt7,tform);
M7=pcCloudout.Location;
M7(:,1) = pcCloudout.Location(:,1);
M7(:,2) = pcCloudout.Location(:,2)+600;
M7(:,3) = pcCloudout.Location(:,3);
M7=M7';
figure;
pt = pointCloud(M7');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M7, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);   
n = length(M7);
Dicp = Ricp * M7 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)
%%
data8=csvread('data_xyz_36.csv');
M8 = data8';
for csv_num = 37:40
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data8a= csvread(num);
    D = unique(data8a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M8, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M8 = [Dicp M8];
       
end
pt8 = pointCloud(M8');

theta = 100;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt8,tform);
M8=pcCloudout.Location;
M8(:,1) = pcCloudout.Location(:,1)-100;
M8(:,2) = pcCloudout.Location(:,2)+600;
M8(:,3) = pcCloudout.Location(:,3);
M8=M8';
figure;
pt = pointCloud(M8');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M8, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M8);
Dicp = Ricp * M8 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data9=csvread('data_xyz_41.csv');
M9= data9';
for csv_num = 42:45
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data9a= csvread(num);
    D = unique(data9a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M9, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M9 = [Dicp M9];
    
    
end
pt9 = pointCloud(M9');

theta = 105;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt9,tform);
M9=pcCloudout.Location;
M9(:,1) = pcCloudout.Location(:,1)-300;
M9(:,2) = pcCloudout.Location(:,2)+600;
M9(:,3) = pcCloudout.Location(:,3);
M9=M9';
figure;
pt = pointCloud(M9');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M9, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);  
n = length(M9);
Dicp = Ricp * M9 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data10=csvread('data_xyz_46.csv');
M10 = data10';
for csv_num = 47:50
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data10a= csvread(num);
    D = unique(data10a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M10, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M10 = [Dicp M10]; 
end
pt10 = pointCloud(M10');

theta = 100;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt10,tform);
M10=pcCloudout.Location;
M10(:,1) = pcCloudout.Location(:,1)-600;
M10(:,2) = pcCloudout.Location(:,2)+600;
M10(:,3) = pcCloudout.Location(:,3);
M10=M10';
figure;
pt = pointCloud(M10');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M10, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M10);
Dicp = Ricp * M10 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data11=csvread('data_xyz_51.csv');
M11 = data11';
for csv_num = 52:55
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data11a= csvread(num);
    D = unique(data11a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M11, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M11 = [Dicp M11];
    
    
end
pt11 = pointCloud(M11');

theta = 90;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt11,tform);
M11=pcCloudout.Location;
M11(:,1) = pcCloudout.Location(:,1)-600;
M11(:,2) = pcCloudout.Location(:,2)+600;
M11(:,3) = pcCloudout.Location(:,3);
M11=M11';
figure;
pt = pointCloud(M11');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M11, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);  
n = length(M11);
Dicp = Ricp * M11 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data12=csvread('data_xyz_56.csv');
M12 = data12';
for csv_num = 57:60
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data12a= csvread(num);
    D = unique(data12a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M12, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M12 = [Dicp M12];
    
end
pt12 = pointCloud(M12');

theta = 100;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt12,tform);
M12=pcCloudout.Location;
M12(:,1) = pcCloudout.Location(:,1)-700;
M12(:,2) = pcCloudout.Location(:,2)+500;
M12(:,3) = pcCloudout.Location(:,3);
M12=M12';
figure;
pt = pointCloud(M12');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M12, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true); 
n = length(M12);
Dicp = Ricp * M12 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data13=csvread('data_xyz_61.csv');
M13 = data13';
for csv_num = 62
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data13a= csvread(num);
    D = unique(data13a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M13, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M13 = [Dicp M13];
    
end
pt13 = pointCloud(M13');

theta = 110;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt13,tform);
M13=pcCloudout.Location;
M13(:,1) = pcCloudout.Location(:,1)-600;
M13(:,2) = pcCloudout.Location(:,2)+600;
M13(:,3) = pcCloudout.Location(:,3);
M13=M13';
figure;
pt = pointCloud(M13');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M13, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M13);
Dicp = Ricp * M13 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data14=csvread('data_xyz_63.csv');
M14 = data14';
for csv_num = 64
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data14a= csvread(num);
    D = unique(data14a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M14, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M14 = [Dicp M14];
    
end
pt14 = pointCloud(M14');

theta = 135;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt14,tform);
M14=pcCloudout.Location;
M14(:,1) = pcCloudout.Location(:,1)-700;
M14(:,2) = pcCloudout.Location(:,2)+600;
M14(:,3) = pcCloudout.Location(:,3);
M14=M14';
figure;
pt = pointCloud(M14');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M14, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M14);
Dicp = Ricp * M14 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)
%%
data15=csvread('data_xyz_65.csv');
M15 = data15';
for csv_num = 66:67
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data15a= csvread(num);
    D = unique(data15a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M15, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M15 = [Dicp M15];
    
end
pt15 = pointCloud(M15');

theta = 170;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt15,tform);
M15=pcCloudout.Location;
M15(:,1) = pcCloudout.Location(:,1)-800;
M15(:,2) = pcCloudout.Location(:,2)+400;
M15(:,3) = pcCloudout.Location(:,3);
M15=M15';
figure;
pt = pointCloud(M15');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M15, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M15);
Dicp = Ricp * M15 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data16=csvread('data_xyz_68.csv');
M16 = data16';
for csv_num = 69:75
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data16a= csvread(num);
    D = unique(data16a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M16, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M16 = [Dicp M16];
    
end
pt16 = pointCloud(M16');

theta = 195;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt16,tform);
M16=pcCloudout.Location;
M16(:,1) = pcCloudout.Location(:,1)-900;
M16(:,2) = pcCloudout.Location(:,2)+300;
M16(:,3) = pcCloudout.Location(:,3);
M16=M16';
figure;
pt = pointCloud(M16');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M16, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
   
n = length(M16);
Dicp = Ricp * M16 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data17=csvread('data_xyz_76.csv');
M17 = data17';
for csv_num = 77:80
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data17a= csvread(num);
    D = unique(data17a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M17, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M17 = [Dicp M17];
end
pt17 = pointCloud(M17');

theta = 195;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt17,tform);
M17=pcCloudout.Location;
M17(:,1) = pcCloudout.Location(:,1)-1000;
M17(:,2) = pcCloudout.Location(:,2);
M17(:,3) = pcCloudout.Location(:,3);
M17=M17';
figure;
pt = pointCloud(M17');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M17, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M17);
Dicp = Ricp * M17 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)

%%
data18=csvread('data_xyz_81.csv');
M18 = data18';
for csv_num = 82:85
    i = int2str(csv_num);
    num = ['data_xyz_', i ,'.csv'];
    
    data18a= csvread(num);
    D = unique(data18a, 'rows');
    D = D';
    
    [Ricp ,Ticp, ER, t] = icp(M18, D, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D + repmat(Ticp, 1, n);
    M18 = [Dicp M18];
end
pt18 = pointCloud(M18');

theta = 200;
A=[cosd(theta) sind(theta) 0 0;
  -sind(theta) cosd(theta) 0 0;
  0 0 1 0;
  0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt18,tform);
M18=pcCloudout.Location;
M18(:,1) = pcCloudout.Location(:,1)-1000;
M18(:,2) = pcCloudout.Location(:,2);
M18(:,3) = pcCloudout.Location(:,3);
M18=M18';
figure;
pt = pointCloud(M18');
pcshow(pt)

%%
[Ricp, Ticp, ER, t] = icp(M, M18, iteration_time, 'Matching', 'kDtree', 'Extrapolation', true);
n = length(M18);
Dicp = Ricp * M18 + repmat(Ticp, 1, n);
M = [Dicp M];

figure;
pt = pointCloud(M');
pcshow(pt)


