function [const] = get_const()

    % Position of every channel from x_0 [m]
    const.ch_position = zeros(1,8);
    for i = 1:length(const.ch_position)
        const.ch_position(i) = 1.375*0.0254 + 0.0127*(i-1);
    end
    
    % Aluminum constants
    const.alum.rho = 2810; % density [kg/m^3]
    const.alum.cp = 960; % specific heat capacity [J/kgK]
    const.alum.k = 130; % thermal conductivity [W/mK]
    const.alum.alpha = const.alum.k / (const.alum.rho * const.alum.cp);
    
    % Brass constants
    const.brass.rho = 8500; % density [kg/m^3]
    const.brass.cp = 380; % specific heat capacity [J/kgK]
    const.brass.k = 115; % thermal conductivity [W/mK]
    const.brass.alpha = const.brass.k / (const.brass.rho * const.brass.cp);
    
    % Stainless steel constants
    const.steel.rho = 8000; % density [kg/m^3]
    const.steel.cp = 500; % specific heat capacity [J/kgK]
    const.steel.k = 16.2; % thermal conductivity [W/mK]
    const.steel.alpha = const.steel.k / (const.steel.rho * const.steel.cp);

    % Rod cross section dimensions
    const.d = 1*0.0254;  % diameter [m]
    const.A = pi/4*const.d^2; % cross sectional area [m^2]
    const.L = 0.149225; % length from x_0 to heater

end