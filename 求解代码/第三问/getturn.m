function [v_turn] = getturn(alfa)
    v_turn = [cosd(alfa),-sind(alfa);sind(alfa),cosd(alfa)];
end

