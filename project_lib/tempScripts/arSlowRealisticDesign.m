function arSlowRealisticDesign(iSimus)

currDir = pwd;
if contains(currDir, 'Isensee')
    rngSeed = 803153085;
elseif contains(currDir, 'Sobotta')
    rngSeed = 2487929334;
else
    error('Unknown project');
end

arManyRealisticDesigns(iSimus, 'rngSeed', rngSeed);

end