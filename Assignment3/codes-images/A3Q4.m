rgb=cell(1,6);
for i=1:6
    rgb{i} = imread([num2str(i-1) '.png']);
end

paranoma65=makePanorama(rgb{6},rgb{5},'r',1,0.75,3);
% paranoma65=makeParanoma7(rgb{6},rgb{5},'r',1,0.8,3);
% paranoma65_l=makeParanoma6(img{6},img{5},'l',0.8,0.7,1.7);

paranoma43=makePanorama(rgb{4},rgb{3},'l',1,0.8,2);

paranoma21=makePanorama(rgb{2},rgb{1},'l',1,0.8,1.5);
% paranoma21_r=makeParanoma6(img{2},img{1},'r',1,0.8,1.5);
% 
% paranoma4321=makeParanoma7(paranoma43,paranoma21,'l',1,0.75,1);
% % paranoma4321=makeParanoma6(paranoma43,paranoma21,'l',1,0.75,1);
% 

paranoma6543=makePanorama(paranoma65,paranoma43,'r',0.8,0.75,5);

paranoma654321=makePanorama(paranoma6543,paranoma21,'l',0.8,0.7,5);