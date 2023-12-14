% 坡面旋转
alfa = -1.5;
% 测线面旋转
beta = 0:5:315;
% 旋转矩阵
% 坡面向量
v_turn = getturn(alfa);
p = [0;1];
pp = v_turn * p;
pp1 = [pp(1),0,pp(2)];
% 测线
p1 = [0;1];
deta = zeros(length(beta),1);
for i =1:length(beta)
    if  mod(beta(i),90) ==0
        deta(i) = alfa;
        continue
    end
    v_turn2 = getturn(90-beta(i));
    pp2 = v_turn2 * p1;
    syms r s t
    pp2(end+1) = 0;
    % 求解行列式
    am = det([ r s t;pp1;pp2']);
    % 提取向量
    temp = coeffs(am,'r');
    am1(1)= temp(2);
    temp = coeffs(am,'s');
    am1(2)= temp(2);
    temp = coeffs(am,'t');
    am1(3)= temp(2);
    deta(i) = GetGama(am1);
end
theta = 120;
alfa = abs(deta)';
% 测量距离
distance = 0:0.3:2.1;
% 测量角
beta = 0:45:315;
% 一海里等于1852米
distance = distance*1852;
% 计算深度
depth = 120;
water_depth = depth-sind(beta-90)'*distance.*tand(1.5);
w = zeros(8,8);
% 计算覆盖长度
for i=1:length(beta)
    w(i,:) = water_depth(i,:).*tand(theta/2)*2;
    if mod(beta(i),90)==0
        if beta(i)==0
             continue
        elseif beta(i)==180
             continue
        end
    else
            % 红长边
        l1 = w(i,:)/2.*sind(90+theta/2)./sind(90-theta/2-alfa(i));
        l2 = w(i,:)/2.*sind(90-theta/2)./sind(90+theta/2-alfa(i));
        % 覆盖宽度
        w(i,:) = l1+l2;
    end
end
%     求解伽马夹角
function deta = GetGama(accross)
    % 平面方向量(0,0,1)
    n1 = [0,0,1];
    deta = acosd(dot(accross,n1)/norm(n1)*norm(accross))-90;
end
function [v_turn] = getturn(alfa)
    v_turn = [cosd(alfa),-sind(alfa);sind(alfa),cosd(alfa)];
end