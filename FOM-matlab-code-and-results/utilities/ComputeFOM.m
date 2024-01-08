function fom = ComputeFOM(Ref_img, goal_img)
a = 1/9.0; % 公式中比例常数
edgeNum_Ref = length(find(Ref_img)); % 理想图像或者参考图像的边缘点数量
edgeNum_goal = length(find(goal_img)); % 目标图像的边缘点数量

MaxEdgeNum = max(edgeNum_Ref, edgeNum_goal); % 计算两图像中边缘点数量多的图像的数量

[row_Ref, col_Ref] = find(Ref_img); % 获取图像中不为0的点的坐标，也就是边缘点的坐标
[row_goal, col_goal] = find(goal_img);

rowNum_Ref = size(Ref_img, 1); % 参考图像的行和列的数量
colNum_Ref = size(Ref_img, 2);

d = sqrt(rowNum_Ref^2 + colNum_Ref^2) * ones(1, length(find(Ref_img))); % 图像的对角线像素数*（1，参考图像边缘点的数量）大小的全为1的矩阵，结果应该是值全为对角线值
dd = zeros(1, length(find(goal_img))); % 创建一个（1，目标图像边缘点数量）大小的全为1的矩阵

for i = 1:length(find(goal_img))
    for j = 1:length(find(Ref_img))
        d(j) = (row_goal(i) - row_Ref(j))^2 + (col_goal(i) - col_Ref(j))^2; % 理想边缘点最近欧式距离d的平方值即为所求
    end
    dd(i) = min(d);
end

fom = sum(9.0 ./ (9.0 + dd)) / MaxEdgeNum;
