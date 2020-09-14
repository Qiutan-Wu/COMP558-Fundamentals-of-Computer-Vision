rgb=cell(1,6);
for i=1:6
%     rgb{i} = imread([num2str(i-1) '.png']);
    rgb{i} = imread(['myImage' num2str(i-1) '.jpg']);
end

paranoma65=makePanorama(rgb{6},rgb{5},'r',0.4,0.7,5);

paranoma43=makePanorama(rgb{4},rgb{3},'l',0.3,0.7,5);

paranoma21=makePanorama(rgb{2},rgb{1},'l',0.4,0.6,6);

paranoma6543=makePanorama(paranoma65,paranoma43,'r',0.4,0.7,6);
% 
% paranoma654321=makeParanoma7(paranoma6543,paranoma21,'l',0.8,0.7,5);