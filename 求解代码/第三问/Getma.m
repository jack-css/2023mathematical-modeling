function deta = Getma(accross)
    % 平面方向量(0,0,1)
    n1 = [0,0,1];
    deta = asind(dot(accross,n1)/norm(n1)*norm(accross));
end


