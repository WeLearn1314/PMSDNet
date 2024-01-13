function fom = ComputeFOM(Ref_img, goal_img)
a = 1/9.0; % Proportional constant in the formula
edgeNum_Ref = length(find(Ref_img)); % Number of edge points in the reference image
edgeNum_goal = length(find(goal_img)); % Number of edge points in the goal image

MaxEdgeNum = max(edgeNum_Ref, edgeNum_goal); % Calculate the maximum number of edge points between the two images

[row_Ref, col_Ref] = find(Ref_img); % Get the coordinates of non-zero points in the reference image, i.e., the edge points' coordinates
[row_goal, col_goal] = find(goal_img);

rowNum_Ref = size(Ref_img, 1); % Number of rows in the reference image
colNum_Ref = size(Ref_img, 2);

d = sqrt(rowNum_Ref^2 + colNum_Ref^2) * ones(1, length(find(Ref_img))); % Create a matrix of ones with size (1, number of edge points in the reference image) multiplied by the diagonal pixel count of the image, the result should be a matrix with all values equal to the diagonal value
dd = zeros(1, length(find(goal_img))); % Create a matrix of zeros with size (1, number of edge points in the goal image)

for i = 1:length(find(goal_img))
    for j = 1:length(find(Ref_img))
        d(j) = (row_goal(i) - row_Ref(j))^2 + (col_goal(i) - col_Ref(j))^2; % Squared Euclidean distance d from the nearest ideal edge point
    end
    dd(i) = min(d);
end

fom = sum(9.0 ./ (9.0 + dd)) / MaxEdgeNum;