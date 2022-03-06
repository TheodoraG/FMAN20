close all;
clear all;
clc;

%%3.1
x_train_1 = [0.4003 0.3988 0.3998 0.3997];
x_test_1 = [0.4010 0.3995 0.3991];

x_train_2 = [0.2554 0.3139 0.2627 0.3802];
x_test_2 = [0.3287 0.3160 0.2924];

x_train_3 = [0.5632 0.7687 0.0524 0.7586];
x_test_3 = [0.4243 0.5005 0.6769];

X_train = [x_train_1 x_train_2 x_train_3]';
X_test = [x_test_1 x_test_2 x_test_3]';
y_train = [1 1 1 1 2 2 2 2 3 3 3 3]';
y_test = [1 1 1 2 2 2 3 3 3]';

mdl = fitcknn(X_train,y_train)
flwrClass = predict(mdl,X_test)
