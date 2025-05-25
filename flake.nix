{
  description = "Flake template";
  outputs = { self }: {
    templates = {
      example = {
        path = ./nixos;
        description = "Flake config";
      };
    };
    defaultTemplate = self.templates.example;
  };
}
