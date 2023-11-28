% Keegan Smith
% Intro to Probability and Random Processes
% Spring 2022
% MatLab Project


% GDP matrix declaration, numbers are percentages numbers start from 2010 and end in 2020 %
%  year:      |  10 |  11  |  12  |  13  |  14  |  15  |  16  |  17  |  18  |  19  |   20   |
US_GDP      = [2.564, 1.551, 2.250, 1.842, 2.526, 3.076, 1.711, 2.333, 2.996, 2.161, -3.405 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=US&start=2010&view=chart     
Japan_GDP   = [4.098, 0.024, 1.375, 2.005, 0.296, 1.561, 0.754, 1.675, 0.559, 0.270, -4.586 ]; % https://data.worldbank.org/indicator/ny.gdp.mktp.kd.zg?end=2020&locations=jp&start=2010&view=chart
Germany_GDP = [4.180, 3.925, 0.418, 0.438, 2.210, 1.492, 2.230, 2.680, 1.086, 1.056, -4.570 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=DE&start=2010&view=chart
France_GDP  = [1.949, 2.193, 0.313, 0.576, 0.956, 1.113, 1.095, 2.291, 1.865, 1.843, -7.855 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=FR&start=2010&view=chart
Italy_GDP   = [1.713, 0.707,-2.981,-1.841,-0.005, 0.778, 1.293, 1.668, 0.926, 0.410, -8.939 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=IT&start=2010&view=chart
UK_GDP      = [2.131, 1.458, 1.470, 1.890, 2.991, 2.623, 2.263, 2.134, 1.651, 1.672, -9.396 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=GB&start=2010&view=chart
Canada_GDP  = [3.089, 3.147, 1.762, 2.329, 2.870, 0.659, 1.001, 3.040, 2.777, 1.880, -5.233 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=CA&start=2010&view=chart
Brazil_GDP  = [7.528, 3.974, 1.921, 3.005, 0.504,-3.546,-3.276, 1.323, 1.784, 1.411, -4.059 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=BR&start=2010&view=chart
Spain_GDP   = [0.163,-0.814,-2.959,-1.435, 1.384, 3.835, 3.031, 2.974, 2.289, 2.085,-10.823 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=ES&start=2010&view=chart
Russia_GDP  = [4.500, 4.300, 4.024, 1.755, 0.736,-1.973, 0.194, 1.826, 2.807, 2.033, -2.951 ]; % https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?end=2020&locations=RU&start=2010&view=chart

% Mean calculation of each Country %

US_mean      = sum(US_GDP)      / 10;
Japan_mean   = sum(Japan_GDP)   / 10;
Germany_mean = sum(Germany_GDP) / 10;
France_mean  = sum(France_GDP)  / 10;
Italy_mean   = sum(Italy_GDP)   / 10;
UK_mean      = sum(UK_GDP)      / 10;
Canada_mean  = sum(Canada_GDP)  / 10;
Brazil_mean  = sum(Brazil_GDP)  / 10;
Spain_mean   = sum(Spain_GDP)   / 10;
Russia_mean  = sum(Russia_GDP)  / 10;

% variance = sqrt( sum(each value - mean)^2 / number of values (10) ) %

US_variance      = sqrt( (sum( US_GDP      - US_mean)      )^2 / 10 );
Japan_variance   = sqrt( (sum( Japan_GDP   - Japan_mean)   )^2 / 10 );
Germany_variance = sqrt( (sum( Germany_GDP - Germany_mean) )^2 / 10 );
France_variance  = sqrt( (sum( France_GDP  - France_mean)  )^2 / 10 );
Italy_variance   = sqrt( (sum( Italy_GDP   - Italy_mean)   )^2 / 10 );
UK_variance      = sqrt( (sum( UK_GDP      - UK_mean)      )^2 / 10 ); 
Canada_variance  = sqrt( (sum( Canada_GDP  - Canada_mean)  )^2 / 10 );
Brazil_variance  = sqrt( (sum( Brazil_GDP  - Brazil_mean)  )^2 / 10 );
Spain_variance   = sqrt( (sum( Spain_GDP   - Spain_mean)   )^2 / 10 );
Russia_variance  = sqrt( (sum( Russia_GDP  - Russia_mean)  )^2 / 10 );

% Print statements for each Countries Mean and variance %

fprintf('\nUS sum: %f\nUS mean: %f\nUS variance: %f\n\n',              sum(US_GDP),      US_mean,      US_variance     );
fprintf('Japan sum: %f\nJapan mean: %f\nJapan variance: %f\n\n',       sum(Japan_GDP),   Japan_mean,   Japan_variance  );
fprintf('Germany sum: %f\nGermany mean: %f\nGermany variance: %f\n\n', sum(Germany_GDP), Germany_mean, Germany_variance);
fprintf('France sum: %f\nFrance mean: %f\nFrance variance: %f\n\n',    sum(France_GDP),  France_mean,  France_variance );
fprintf('Italy sum: %f\nItaly mean: %f\nItaly variance: %f\n\n',       sum(Italy_GDP),   Italy_mean,   Italy_variance  );
fprintf('UK sum: %f\nUK mean: %f\nUK variance: %f\n\n',                sum(UK_GDP),      UK_mean,      UK_variance     );
fprintf('Canada sum: %f\nCanada mean: %f\nCanda variance: %f\n\n',     sum(Canada_GDP),  Canada_mean,  Canada_variance );
fprintf('Brazil sum: %f\nBrazil mean: %f\nBrazil variance: %f\n\n',    sum(Brazil_GDP),  Brazil_mean,  Brazil_variance );
fprintf('Spain sum: %f\nSpain mean: %f\nSpain variance: %f\n\n',       sum(Spain_GDP),   Spain_mean,   Spain_variance  ); 
fprintf('Russia sum: %f\nRussia mean: %f\nRussia variance: %f\n\n',    sum(Russia_GDP),  Russia_mean,  Russia_variance );

% Covariance Calculations %

US_covariance = cov(US_GDP);
UK_covariance = cov(UK_GDP);

fprintf('US CoVar = %f\nUK CoVar = %f\n', US_covariance, UK_covariance);


% Extrapolation for US and Japan %

% US_GDP;     % [2.564, 1.551, 2.250, 1.842, 2.526, 3.076, 1.711, 2.333, 2.996, 2.161, -3.405 ]
% Japan_GDP;  % [4.098, 0.024, 1.375, 2.005, 0.296, 1.561, 0.754, 1.675, 0.559, 0.270, -4.586 ]
% Years ====  % [2010 ,  2011,  2012,  2013,  2014,  2015,  2016,  2017,  2018,  2019,  2020  ]
 
x = [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020];

US_extrap_21 = interp1( x, US_GDP, 2021, 'linear', 'extrap' );
Japan_extrap_21 = interp1( x, Japan_GDP, 2021, 'linear', 'extrap' );

fprintf("\nUS extrapolated GDP for 2021: %f\n", US_extrap_21);
fprintf("Japan extrapolated GDP for 2021: %f\n", Japan_extrap_21);

