// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  updateChannel: "canary",
  config: {
    // default font size in pixels for all tabs
    fontSize: 20,
    windowSize: [1080, 720],
    fontFamily: '"Operator Mono", "Inconsolata for Powerline", monospace',
    cursorShape: "BLOCK",
    padding: "10px",
    shell: "/bin/zsh"
  },

  plugins: ["hyperborder", "hyper-snazzy"]
};
