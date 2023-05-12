% With this code we want to select the clusters in the JID that have a
% significant relationship between the ITI and [parameters]. 

function significant_pixels = GetPopulationClusters(data, p_threshold)
% the function takes in the data and p_threshold, and outputs the variable
% named significant_pixels. 
% some type of feature selection to select the variables based on the
% p-value threshold 

 significant_pixels = struct('pixel_index', [], 'pixels', []);

% significant_pixels = creates an empty struct that can store the
% significant pixels. I chose a struct so that I can, after they have been
% selected, exame the individual slopes for each participant per pixel.

 pixel_regressions = numel(fieldnames(regression_results));

% with this output, the code can loop over all of the pixel_regression numbers in the 
% struct and collect the ones that have a significant p-value (that will be 
% stored in something like the pixel_regression.result). After, the code collects
% these pixel_regression variables that have significant values, and put them in a new struct 
% so that i can examine them accordingly in this struct. 

%loop over all pixels in the struct

for i = 1:pixel_regressions %loops over all pixel regressions
        pixel_regression = regression_results(i); 
        if pixel_regression.result.p_value < p_threshold %if the pixel regression is below the threshold 
            pixel_index = i; %assigns current iteration value i to pixel_index = storing the index of the significant pixel 
            pixels = pixel_regression; %stores the result of the pixel_regression to the variable 'pixel' 
            significant_pixels(end+1).pixel_index = pixel_index; %this means that after the last pixel element, a new element in the struct will be created in which the current significant pixel can be stored. 
            significant_pixels(end).pixels = pixels; %final step of creating the new element in the struct. It closes the element. 
        end
end

        
         

    



