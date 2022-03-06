clear all;
close all;
clc;

%%4
eps = 0.05;

prob_1 = 0.25*(1-eps)*(1-eps)*(1-eps)*eps;
prob_2 = 0.5*eps*eps*eps*(1-eps);
prob_3 = 0.25*eps*(1-eps)*(1-eps)*eps;

prob_x = prob_1 + prob_2 + prob_3;

prob_B_1 = prob_1 / prob_x
prob_B_2 = prob_2 / prob_x
prob_B_3 = prob_3 / prob_x

%%5
eps_5 = 0.2;

prob_1_5 = 0.3*(eps_5^6)*((1-eps_5)^10);
prob_2_5 = 0.2*(eps_5^4)*((1-eps_5)^12);
prob_3_5 = 0.2*(eps_5^6)*((1-eps_5)^10);
prob_4_5 = 0.3*(eps_5^8)*((1-eps_5)^8);

prob_x_5 = prob_1_5 + prob_2_5 + prob_3_5 + prob_4_5;

prob_B_1_5 = prob_1_5 / prob_x_5
prob_B_2_5 = prob_2_5 / prob_x_5
prob_B_3_5 = prob_3_5 / prob_x_5
prob_B_4_5 = prob_4_5 / prob_x_5

%%6
eps_b = 0.35;
eps_w = 0.25;

% prob_1_6 = 0.25*((1-eps_w)^5)*((1-eps_b)^5)*(eps_w^5);
% prob_2_6 = 0.4*(eps_b^2)*((1-eps_w)^5)*((1-eps_b)^3)*(eps_w^5);
% prob_3_6 = 0.35*(eps_b^1)*((1-eps_w)^7)*((1-eps_b)^4)*(eps_w^3);

prob_1_6 = 0.25*((1-eps_b)^5)*((1-eps_w)^5)*(eps_w^5);
prob_2_6 = 0.4*(eps_b^2)*((1-eps_b)^5)*((1-eps_w)^3)*(eps_w^5);
prob_3_6 = 0.35*(eps_b^1)*((1-eps_b)^7)*((1-eps_w)^4)*(eps_w^3);

prob_x_6 = prob_1_6 + prob_2_6 + prob_3_6;

prob_B_1_6 = prob_1_6 / prob_x_6
prob_B_2_6 = prob_2_6 / prob_x_6
prob_B_3_6 = prob_3_6 / prob_x_6
