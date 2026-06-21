{
  flake.templates = {
    rust = {
      path = ./_rust;
      description = "rust development environment";
    };
    cpp = {
      path = ./_cpp;
      description = "c++ development environment";
    };
  };
}
