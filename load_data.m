function [ class_label, word_frequency ] = load_data(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    loaded_file = load('train.data');
    word_frequency = spconvert(loaded_file);
    class_label = load('train.label');
    
    
    
    

end

