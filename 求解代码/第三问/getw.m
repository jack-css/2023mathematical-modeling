function [w0] = getw(D0,alfa)
% 根据深度求w
    theta = 120;
    w = tand(theta/2)*D0*2;
    % 左边红边
    l1 = w/2*sind(90+theta/2)/sind(90-theta/2-alfa);
    l2 = w/2*sind(90-theta/2)/sind(90+theta/2-alfa);
    % 覆盖宽度
    w0 = l1+l2;
end

