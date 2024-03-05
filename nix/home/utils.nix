{...}: {
  config.lib.mine.mkLink = config: relative: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/repos/dot-files/${relative}";
}
