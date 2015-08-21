function [ w0, weights ] = det_log_reg_param( class_label, word_frequency )
    
    step_size = 0.0001;
    w0 = 0;
    weights = zeros(1, size(word_frequency,2));
    prev_weights = zeros(1, size(word_frequency,2));
    
    % get weight sum 
    weight_sum = sum(repmat(weights, size(word_frequency, 1), 1) .* word_frequency ,2) + ...
                   repmat(w0, size(word_frequency,1), 1);
               
    probability = exp(weight_sum) ./ (exp(weight_sum) + ones(size(word_frequency,1), 1));
    
    w_delta = 65536;
    i = 1;
    while(w_delta > 0.001)
        prev_weights = weights;
        
        gradient = sum(word_frequency .* repmat(class_label - probability, 1, size(word_frequency,2))) ;
        
        % update gradient with step size
        gradient = gradient * step_size;
        
        % now update weight with gradients
        w0 = w0 + step_size*sum(class_label - probability);
        weights = weights + gradient;
        
        % determine update in probability
        
        weight_sum = sum(repmat(weights, size(word_frequency, 1), 1) .* word_frequency ,2) + ...
                   repmat(w0, size(word_frequency,1), 1);
               
        probability = exp(weight_sum) ./ (exp(weight_sum) + ones(size(word_frequency,1), 1));
        
        %calculate delta to stop the iteration
        w_delta = sqrt(sum((prev_weights - weights) .* (prev_weights - weights)));
        if( mod(i, 100) == 0)
            fprintf('Iteration: %d\n', i);
            fprintf('Delta in weights: %f\n', w_delta);
        end
        i = i + 1; 
    end
    
  


end

