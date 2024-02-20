local wk = require('which-key');

wk.register({
  P = { '<CMD>Glow<CR>', 'Preview' },
}, {
    prefix = '<localleader>',
    buffer = 0,
    noremap = true,
    silent = true,
    mode = 'n',
});
