function arConfigReset()

global ar

ar = rmfield(ar, 'config');
ar = arInitFields(ar);

end