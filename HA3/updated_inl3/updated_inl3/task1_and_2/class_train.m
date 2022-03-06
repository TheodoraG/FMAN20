function classification_data = class_train(X, Y)
    %concatenate the data so that we have the first columns
    %with x and the last column with the corresponding Y for each row
    %classification_data = [X' Y'];
    classification_data = [X; Y];
end

