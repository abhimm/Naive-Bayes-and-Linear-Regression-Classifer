function [ class_label, word_frequency ] = load_data_train(  )
    loaded_file = load('train.data');
    word_frequency = spconvert(loaded_file);
    class_label = load('train.label');
 end

