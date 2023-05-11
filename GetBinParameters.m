
function exponents = GetBinParameters(EEG_ICA, s_rate)
    exponents = zeros(size(EEG_ICA.data,3), 2);
    %initialize matrix for exponents. Here, we assume that EEG_ICA.data,3 is
    %the third column of the ICA array, which can be the latencies (starting
    %times) of each bin. This way, the code would run over every bin. 
    % ,2) sets a empty matrix in which 2 values can be stored. 
    for i = 1:size(EEG_ICA.data,3) % selects the value in the array that we are interested in. 
        data = EEG_ICA.data(:,:,i)'; % loops over every created bin in the array. %using this code makes it that the bin number in the array can vary
        %across participants
        [psd, freqs] = pwelch(data, [], [], [], s_rate);
        %[psd, freqs] = pwelch(x, window, noverlap, nfft, fs);
        % window default = [] = Hann window
        % noverlap default = [] = half the length of the window. The bigger the
        % window, the better the frequency resolution
        % nfft default = [] = affects the frequency resolution of the power:
        % default = power of 2
        % spectrum: s_rate 
        freqs = freqs';
        psd = psd';
        settings = struct(); % use default settings
        f_range = [1, 40]; % set frequency range of interest
        fooof_results = fooof(freqs, psd, f_range, settings, false); % run FOOOF
        exponents(i,1) = i; % store bin number in first column
        exponents(i,2) = fooof_results.background_params(2); % store exponent in second column
    end
end

