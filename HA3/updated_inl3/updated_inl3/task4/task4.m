% Task 1: Fit least squares and total least squares lines to data points.

% Clear up
clc;
close all;
clearvars;

% Begin by loading data points from linjepunkter.mat
load linjepunkter

N = length(x); % number of data points

% Plot data
plot(x, y, '*'); hold on;
xlabel('x') 
ylabel('y')
title('Line fitting using LS and TLS') % OBS - CHANGE TITLE!
x_fine = [min(x)-0.05,max(x)+0.05]; % used when plotting the fitted lines

% Fit a line to these data points with least squares
% Here you should write code to obtain the p_ls coefficients (assuming the
% line has the form y = p_ls(1) * x + p_ls(2)).
A = ones(length(x),2);
A(:,1) = x;
%p_ls = [rand(), 6]; % REMOVE AND REPLACE WITH LEAST SQUARES
p_ls = A\y
plot(x_fine, p_ls(1) * x_fine + p_ls(2))

% Fit a line to these data points with total least squares.
% Note that the total least squares line has the form 
% ax + by + c = 0, but the plot command requires it to be of the form
% y = kx + m, so make sure to convert appropriately.
sum11 = 0;
sum12 = 0;
sum21 = 0;
sum22 = 0;
sum_x_sqrd = 0;
sum_x = 0;
sum_y = 0;
sum_xy = 0;
sum_y_sqrd = 0;
for i = 1:length(x)
    sum_x_sqrd  = sum_x_sqrd + x(i)*x(i);
    sum_x = sum_x + x(i);
    sum_xy = sum_xy + x(i)*y(i);
    sum_y = sum_y + y(i);    
    sum_y_sqrd = sum_y_sqrd +y(i)*y(i);
end
A = [sum_x_sqrd - sum_x*sum_x/length(x), sum_xy - sum_x*sum_y/length(x); sum_xy - sum_x*sum_y/length(x) sum_y_sqrd-sum_y*sum_y/length(x)]
[eig_val,eig_array] = eig(A)
a1 = eig_val(1,1)
b1 = eig_val(1,2)
c1 = -(a1*sum_x+b1*sum_y)/length(x)

a2 = eig_val(2,1)
b2 = eig_val(2,2)
c2 = -(a2*sum_x+b2*sum_y)/length(x)

sum_1 = sum((a1*x+b1*y+c1).^2)
sum_2 = sum((a2*x+b2*y+c2).^2)

k_tls = -a1/b1;
m_tls = -c1/b1;
p_tls = [k_tls; m_tls];
%p_tls = [rand(), 6]; % REMOVE AND REPLACE WITH TOTAL LEAST SQUARES
plot(x_fine, p_tls(1) * x_fine + p_tls(2), 'k--')

% Legend --> show which line corresponds to what (if you need to
% re-position the legend, you can modify rect below)
h=legend('data points', 'least-squares','total-least-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

% After having plotted both lines, it's time to compute errors for the
% respective lines. Specifically, for each line (the least squares and the
% total least squares line), compute the least square error and the total
% least square error. Note that the error is the sum of the individual
% squared errors for each data point! In total you should get 4 errors. Report these
% in your report, and comment on the results. OBS: Recall the distance formula
% between a point and a line from linear algebra, useful when computing orthogonal
% errors!
%%LS line
y_est_ls = p_ls(1) * x + p_ls(2);
%LS error for LS line
error_dif = (y - y_est_ls);
err_ls = norm(error_dif,2).^2

%TLS error for LS line
d_ls = abs(p_ls(1)*x + (-1)*y + p_ls(2))./sqrt(p_ls(1)*p_ls(1)+1);
err_ls_2 = norm(d_ls,2).^2
%err_2 = sum((y - y_est_ls).^2)

%TLS line
%LS error for TLS line
y_est_tls = p_tls(1) * x + p_tls(2);
error_dif_tls = (y - y_est_tls);
err_tls = norm(error_dif_tls,2).^2

%TLS error for TLS line
d = abs(a1*x+ b1*y + c1)./sqrt(a1*a1+b1*b1);
err_tls_2 = norm(d,2).^2

%%all results
Res = [err_ls err_ls_2; err_tls err_tls_2]
% WRITE CODE BELOW TO COMPUTE THE 4 ERRORS