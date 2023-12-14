clear clc
beta = 135;
theta = 120;
alfa = 1.5;
% 第一条线
am = zeros(100,1);
% for yita = 0.1:0.001:0.2
yita = 0.1;
for beta = 0:25:360
       %     起点深度
    d0 = 110;
    j = 1;
    area = 0;
    b = 0;
    line_all_long = 0;
%     航线距离累计
    d_all = 0;
    if beta == 0 
       flag(beta/5+1) = inf;
       continue
    elseif mod(beta,90)==0
       flag(beta/5+1) = inf;
       continue
    else
         while j
    %     设定yita为10 yita = 1-d/w;
    %     yita = 0.1;
    %     起点深度
            d0 = d0 - b*tand(1.5);
            w0 = getw(d0,abs(Getgama(beta)));
            %     终点深度
            De = d0 + tand(90-beta)*2*1852*tand(1.5);
            w1 = getw(De,abs(Getgama(beta)));
            d = (1-yita)*w1;
            b = d/sind(beta);
            d_all = d_all + d;
%         算其实yita
%         yita0 = 1-d/w0;
%         yita1 = 1-d/w1;
    %     航线长度
            line_all_long = line_all_long + abs(2/cosd(beta-90))*1852;
       %     循环退出条件           
%             小于一半
            if d_all/cosd(beta-90) >2-2*tand(beta-90)
                w2 = getw(110-2*tand(1.5)*1852,abs(Getgama(beta)));
                area = area + 1852*1852*(w0+w2)/2*sqrt(abs(4+2*tand(beta-90)+d/cosd(beta-90)));
            else
                area = area + (w0+w1)*1852*1852;
            end
            if  area > 4*2*1852*1852
%                     disp('sucess')
                flag(beta/5+1) = j;
                break       
            end
            j = j+1;
         end
    end
    am(floor((yita-0.1)/0.001+1)) = min(flag);
end
% end
