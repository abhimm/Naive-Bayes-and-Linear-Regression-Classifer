function [ class_prior, likelihood_estmt_0, likelihood_estmt_1 ] = determine_naive_bayes_param( class_label, word_frequency )
    
    % determining frequency of classes in data set
    class_label_0 = find(class_label == 0);
    class_label_1 = find(class_label == 1);

    % determining class_prior for class 0 and 1
    class_prior = [ size(class_label_0)/size(class_label), size(class_label_1)/size(class_label)];
    
    % applying Laplace smoothing
    likelihood_estmt_0 = (sum(word_frequency(class_label_0, :), 1) + 1)/(sum((sum(word_frequency(class_label_0, :), 1) + 1)));
    likelihood_estmt_1 = (sum(word_frequency(class_label_1, :), 1) + 1)/(sum((sum(word_frequency(class_label_1, :), 1) + 1)));
    
    % take logrithm to simplify calculation later 
    class_prior = log(class_prior);
    likelihood_estmt_0 = log(likelihood_estmt_0);
    likelihood_estmt_1 = log(likelihood_estmt_1);
end

