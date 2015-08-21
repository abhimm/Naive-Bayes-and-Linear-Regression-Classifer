% Load training and test data
[class_label_train, word_frequency_train] = load_data_train();
[class_label_test, word_frequency_test] = load_data_test();

% determine prior probabilities and likelihood_estimates
[class_prior, likelihood_estmt_0, likelihood_estmt_1] = determine_naive_bayes_param(class_label_train, word_frequency_train);

% perform naive bayes classification for training data
accuracy_train_nb = perform_naive_bayes(class_prior, likelihood_estmt_0, likelihood_estmt_1, class_label_train, word_frequency_train);
fprintf('Naive Bayes accuracy over training data: %f\n', accuracy_train_nb);

accuracy_test_nb = perform_naive_bayes(class_prior, likelihood_estmt_0, likelihood_estmt_1, class_label_test, word_frequency_test);
fprintf('Naive Bayes accuracy over test data: %f\n', accuracy_test_nb);


% Linear Regression classifier
[w0, weights] = det_log_reg_param(class_label_train, word_frequency_train);

accuracy_train_lr = perform_linear_regression(class_label_train, word_frequency_train, w0, weights);
fprintf('Lineat Regression accuracy over training data: %f\n', accuracy_train_lr);

accuracy_test_lr = perform_linear_regression(class_label_test, word_frequency_test, w0, weights);
fprintf('Lineat Regression accuracy over test data: %f\n', accuracy_test_lr);


