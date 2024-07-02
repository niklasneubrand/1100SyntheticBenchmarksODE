function simulateIsensee(iSimus)

load(fullfile(pwd(), 'RealisticSimulation', 'info_manyRS','options_manyRS_2024-06-29_08-12-04.mat'))

% reshape the options for handing them to "arManyRealisticDesigns"
optionNames = fieldnames(options);
passOptions = cell(1, 2*length(optionNames));
for i = 1:length(optionNames)
    passOptions{2*i-1} = optionNames{i};
    passOptions{2*i} = options.(optionNames{i});
end

arManyRealisticDesigns(iSimus, passOptions{:});

end