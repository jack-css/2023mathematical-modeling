function [gama] = Getgama(beta)
% 求解gama的值
% 坡面旋转
alfa = -1.5;
% 坡面向量
v_turn = getturn(alfa);
p = [0;1];
pp = v_turn * p;
% 坡面法向量
pp1 = [pp(1),0,pp(2)];
% 测线
p1 = [0;1];
% 如果与深度梯度方向垂直
if  mod(beta,90) ==0
    gama = abs(alfa);
    return 
end
v_turn2 = getturn(90-beta);
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
gama = Getma(am1);

end

