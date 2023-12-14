x = -800:200:800;
theta = 120;
alfa = 1.5;
% 水深
water_depth_y = 70 - tand(alfa).*x;
% 红长边
w = tand(theta/2)*water_depth_y*2;
% 左边红边
l1 = w/2*sind(90+theta/2)/sind(90-theta/2-alfa);
l2 = w/2*sind(90-theta/2)/sind(90+theta/2-alfa);
% 覆盖宽度
l_all = l1+l2;
% 求右边+左边
l_rl = zeros(size(l1)-1);
for i=1:length(l2)-1
    l_rl(i) = l2(i)+l1(i+1);
end
% 求解重合边边长
% 间距
d = 200;
l_common = l_rl-d/cosd(alfa);
yita = (1-d./l_all(2:end))*100;

