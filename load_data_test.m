function [ class_label, word_frequency ] = load_data_test(  )
    loaded_file = load('test.data');
    word_frequency = spconvert(loaded_file);
    class_label = load('test.label');
 end


