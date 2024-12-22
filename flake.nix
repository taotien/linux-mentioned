{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {inherit system;};
    in
      with pkgs; rec {
        devShell = mkShell rec {
          packages = [
            # wezterm # a window into your pc's soul
            nushell # the soul in question
            starship # rice your shell

            helix # batteries included editor
            jujutsu # git but better
            zoxide # fast cd
            direnv # dev w/out breaking system

            skim # find shit
            ripgrep-all # find shit in the shit
            bat # display text

            just # just make it already

            ouch # compress and decompress anything
            sendme # send files easily
            tree # list more stuff
            zellij # multiplex
            pipe-rename # batch rename

            tailscale # no more port forwarding
            wget # download files
            yt-dlp # download video
            miniserve # easy server
            sshfs # ssh but a dir (beagle moment)

            # typesetting
            typst # but in rust
            pandoc # converter
            tectonic # ye olde fashioned way

            bottom # download more ram
            du-dust # download more storage
            mpv # play anything av
            ffmpeg # convert av
            pueue # process queue
            boxxy # don't touch my dirs
            taskwarrior3 # todo list to ignore
            tdf # lmao pdfs in terminal
            hyperfine # benchmarks are bad
            sd # search and destr... I mean replace
            tokei # how many lines?
            pypy3 # python but really fast
            uv # python package managing but really fast
          ];
          buildInputs = [];
          # LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
        };
      });
}
