% 海里与米换算
hc_turn = 1852;
% 南北长
long = 2*hc_turn;
% 东西宽
width = 4*hc_turn;
% 中间深度
depth = 110;
% 坡度1.5
alfa = 1.5;
% water_depth = depth + tand(theta).*[-width/2:width/2];
% beta
beta = 0:10:360;
% 计算伽马
for i =1:length(beta)
    a(i) = Getgama(beta(i));
end
% 解析式伽马的求解
% b = asind(1./sqrt(tand(90-alfa).^2+tand(90-alfa).^2.*tand(beta-90).^2+1));
% b(b==0) = 1.5;
% double(Getgama(30))
% 直线组
for d = 100:700
    b = d ./ cosd(beta-90);
    % 交点(x0,y0)
    % 求交线
    % x轴增量
    xm = 2*1852-b./tand(beta-90);
    xm(mod(beta,90)==0) = 0;
    xm(beta == 180) = [];
    xm(beta == 0) = [];
    z = xm*tand(1.5)+110;
    % 一半区域线条数
    line_len = floor(abs(4*1085.*sind(beta)/d/2))+1;
    line_len(line_len==1) = [];
    % 求解完全在区域内的相等直线
    line_l_alone= sqrt(xm.^2+ones(size(xm))*(4*1852).^2+z.^2);
    line_all_l = line_l_alone *3;
    awef(d-99) = min(abs(line_all_l))
 
end
am = [beta(1:35);line_all_l(1:end)]
plot(am(1,:),am(2,:))
title('\beta与测线总长度关系')
xlabel('\beta^{o}')
ylabel('测线长度/m')


