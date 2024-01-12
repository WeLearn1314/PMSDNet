clear; clc;
format compact;
addpath(fullfile('utilities'));

% real-world CC dataset
fom_sum = 0;
num_images = 15;
for i = 1:num_images
    file_index = sprintf('%d', i);
    ref_img_path = strcat('./results/', file_index, '.png');
    goal_img_path = strcat('./CC-mean/', file_index, '.png');

    Ref_img = imread(ref_img_path);
    goal_img = imread(goal_img_path); 

    fom = ComputeFOM(Ref_img, goal_img);
    disp(fom);
    fom_sum = fom_sum + fom;
end
avg_fom = fom_sum / num_images;
disp(avg_fom);

% Set12
% fom_sum = 0;
% num_images = 12;
% for i = 1:num_images
%     file_index = sprintf('%02d', i);
%     ref_img_path = strcat('./results/', file_index, '.png');
%     goal_img_path = strcat('./Set12/', file_index, '.png');
% 
%     Ref_img = imread(ref_img_path);
%     goal_img = imread(goal_img_path);
% 
%     fom = ComputeFOM(Ref_img, goal_img);
%     disp(fom)
%     fom_sum = fom_sum + fom;
% end
% avg_fom = fom_sum / num_images;
% disp(avg_fom);

% BSD68
% fom_sum = 0;
% num_images = 68;
% for i = 1:num_images
%     file_index = sprintf('%03d', i);
%     ref_img_path = strcat('./results/test', file_index, '.png');
%     goal_img_path = strcat('./Set12/test', file_index, '.png');
% 
%     Ref_img = imread(ref_img_path);
%     goal_img = imread(goal_img_path);
% 
%     fom = ComputeFOM(Ref_img, goal_img);
%     disp(fom)
%     fom_sum = fom_sum + fom;
% end
% avg_fom = fom_sum / num_images;
% disp(avg_fom);