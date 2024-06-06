realisticDir = fullfile(pwd(), '..', '..');

addpath(fullfile(realisticDir, 'RealisticSimulation'));
addpath(fullfile(realisticDir, 'CondObsStructure'));

arManyRealisticDesigns(1:20);