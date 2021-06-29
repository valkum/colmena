{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }: {
    colmena = {
      meta = {
        inherit nixpkgs;
      };

      host-a = { name, nodes, pkgs, ... }: {
        boot.isContainer = true;
        time.timeZone = nodes.host-b.config.time.timeZone;
      };
      host-b = {
        deployment = {
          targetHost = "somehost.tld";
          targetPort = 1234;
          targetUser = "luser";
        };
        boot.isContainer = true;
        time.timeZone = "America/Los_Angeles";
      };
    };
  };
}
