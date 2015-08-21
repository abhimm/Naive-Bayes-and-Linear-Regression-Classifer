function [accuracy] = perform_naive_bayes( class_prior, likelihood_estmt_0, likelihood_estmt_1, class_label_given, word_frequency )
    
    computed_lbl = zeros(size(class_label_given));
    
    for i = 1:size(word_frequency,1)
        cond_prob_0 = class_prior(1,1) + sum(likelihood_estmt_0  .* word_frequency(i, :), 2);
        cond_prob_1 = class_prior(1,2) + sum(likelihood_estmt_1  .* word_frequency(i, :), 2);
        if ( cond_prob_1 > cond_prob_0)
            computed_lbl(i) = 1 ;
        end
        
    end
    
    accuracy = size(find(computed_lbl == class_label_given))/size(class_label_given);
end

