function [ accuracy ] = perform_linear_regression( class_label, word_frequency, w0, weights )

    computed_class_label = zeros(size(word_frequency,1),1);
    weight_sum = repmat(w0, size(word_frequency,1), 1) + sum(repmat(weights, size(word_frequency,1), 1) .* word_frequency, 2);

    % determine class 1 instance
    class_1 = find(weight_sum > 0);

    computed_class_label(class_1) = 1;
    
    accuracy = (size(find(computed_class_label == class_label))/ size(class_label));
end

