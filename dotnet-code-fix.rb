class DotnetFormat < Formula
  desc "Fix C# document using Roslyn"
  homepage "https://github.com/wk-j/dotnet-code-fix"
  url "https://github.com/wk-j/dotnet-code-fix/releases/download/0.1.0/dotnet-code-fix.0.1.0.zip"
  version "0.1.0"
  sha256 "8739c76e681f900923b900c9df0ef75cf421d39cabb54650c4b9ad19b6a76d85"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"dotnet-format").write <<-EOS.undent
      #!/usr/bin/env sh
      dotnet /usr/local/opt/dotnet-code-fix/libexec/DotNetCodeFix.dll $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/dotnet-code-fix"
  end

end